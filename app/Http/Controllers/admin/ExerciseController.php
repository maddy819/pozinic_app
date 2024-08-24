<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\ExercisesImport;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Resources\ExercisesResource;
use App\ExerciseVariations;
use App\ExerciseWorkout;
use App\UserPlaylist;
use App\Settings;
use App\Category;
use App\Exercises;
use App\FocusArea;
use App\GoodFor;
use App\Muscles;
use App\UserRecent;
use App\UserFavourite;
use App\PlaylistSaved;
use File;
use JWTAuth;
use DB;

class ExerciseController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $exercises = Exercises::all();
        $focusAreas = FocusArea::where("exercise", 1)->get();
        $goodFors = GoodFor::all();
        $muscles = Muscles::all();
        $pageTitle = 'Exercises';
        return view('admin.exercises', compact('setting', 'exercises', 'pageTitle', 'focusAreas', 'goodFors', 'muscles'));
    }

    public function store_exercise(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'good_for' => ['required', 'array', 'min:1'],
            'focus_area' => ['required', 'array','min:1'],
            'specific_muscles' => ['array', 'min:1'],
            'level' => ['required', 'array', 'min:1'],
            'image' => ['image', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
            'equipments' => ['required', 'array', 'min:1'],
            'video_link' => ['required', 'string', 'url'],
            'tip_video' => ['required', 'string', 'url'],
            'type' => ['required', 'array', 'min:1']
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(preg_match("/(https?:\/\/)?(www\.)?(player\.)?vimeo\.com\/([a-z]*\/)*([0-9]{6,11})[?]?.*/", request('tip_video'), $output_array)) {
            $videoId = $output_array[5];
        }
        
        $url = "https://vimeo.com/api/oembed.json?url=".urlencode("https://vimeo.com/".$videoId);
        $curl = curl_init();
        curl_setopt_array($curl, array(CURLOPT_URL => $url, CURLOPT_RETURNTRANSFER => true));
        $response = curl_exec($curl);

        if (curl_errno($curl)) {
            $error_msg = curl_error($curl);
        }

        curl_close($curl);

        if (isset($error_msg)) {
            $videoMeta['thumbnail_url'] = NULL;
        } else {
            $videoMeta = json_decode($response, true);
        }

        if(request('level')[0] == "ALL") {
            $levels = implode(',',array('Beginner','Intermediate','Advanced'));
        } else {
            $levels = implode(',',request('level'));
        }

        if(!empty(request('specific_muscles'))) {
            if(count(request('specific_muscles')) > 0) {
                $specific_muscles = implode(',',request('specific_muscles'));
            } else {
                $specific_muscles = NULL;
            }
        } else {
            $specific_muscles = NULL;
        }

        if(request('save') == "Post Exercise") {
            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefile->move('uploads/exercises/images/', $imagefilename);
            } else {
                $imagefilename = 'default-placeholder.png';
            }

            $exCount = Exercises::get()->count();

            if($exCount > 0) {
                $last = Exercises::latest('id')->first()->id;
                $code = "POZEX".($last + 1);
            } else {
                $code = "POZEX1";
            }

            $exerciseData = array('title' => request('title'), 'based_on' => request('based_on'), 'code' => $code, 'duration' => request('duration'), 'slug' => Str::slug(request('title')), 'category_id' => request('category'), 'instructions' => request('instruction'), 'image' => $imagefilename, 'breath' => request('breath'), 'reps' => request('reps'), 'focus_area' => implode(',',request('focus_area')), 'specific_muscles' => $specific_muscles, 'good_for' => implode(',',request('good_for')), 'level' => $levels, 'tags' => request('tags'), 'video_link' => request('video_link'), 'type' => implode(',', request('type')), 'tip_video' => request('tip_video'), 'tip_video_thumbnail' => ($videoMeta) ? $videoMeta['thumbnail_url'] : NULL);
            
            $exercise = Exercises::create($exerciseData);

            if($exercise) {
                $exercise->equipments()->attach(request('equipments'));
                return response()->json(['success'=>'Exercise Saved Successfully']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            if(empty($request->file('image'))) {
                $new_image = request('old_image');
            } else {
                if(!empty(request('old_image'))) {
                    File::delete(request('old_image'));
                }
    
                $image = $request->file('image');
                $ext_image =  $image->getClientOriginalExtension();
                $new_image = time().'.'.$ext_image;
                $image->move('uploads/exercises/images/', $new_image);
            }

            $exerciseData = array('title' => request('title'), 'based_on' => request('based_on'), 'duration' => request('duration'), 'slug' => Str::slug(request('title')), 'category_id' => request('category'), 'instructions' => request('instruction'), 'image' => $new_image, 'breath' => request('breath'), 'reps' => request('reps'), 'focus_area' => implode(',',request('focus_area')), 'specific_muscles' => $specific_muscles, 'good_for' => implode(',',request('good_for')), 'level' => $levels, 'tags' => request('tags'), 'video_link' => request('video_link'), 'type' => implode(',', request('type')), 'tip_video' => request('tip_video'), 'tip_video_thumbnail' => ($videoMeta) ? $videoMeta['thumbnail_url'] : NULL);

            $res1 = Exercises::where('id', $id)->update($exerciseData);

            if($res1) {
                $Exercise = Exercises::find($id);
                $Exercise->equipments()->sync(request('equipments'));
                return response()->json(['success' => 'Exercise Updated Successfully']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function importExercises(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Please upload a valid CSV file..!');
        }

        Excel::import(new ExercisesImport, request()->file('file'));
        return redirect()->back();
    }

    public function edit_exercise(Request $request) {
        $exId = request('exId');
        $exercise = Exercises::with('equipments')->where('id', $exId)->get()->first();
        return \Response::json($exercise);
    }

    public function deleteExercise(Request $request) {
        $ids = explode(",", request('id'));
        DB::beginTransaction();

        try {
            foreach($ids as $id) {
                $exercise = Exercises::find($id);
                $exercise->workouts()->detach($exercise->workouts()->get()->pluck('id'));
                UserRecent::where('exercise_id', $id)->delete();
                UserFavourite::where('exercise_id', $id)->delete();
                PlaylistSaved::where('exercise_id', $id)->delete();
                $res = Exercises::where('id', $id)->delete();
                $destinationPath = public_path("uploads/exercises/images/".$exercise['image']);
                File::delete($destinationPath);
            }

            DB::commit();
            return redirect()->back()->with('success', 'Exercise Deleted Successfully.');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', 'Error Deleting Exercises.');
        }

        
    }

    // public function variation(Exercises $exercise) {
    //     $setting = Settings::all()->first();
    //     $exerciseVariation = $exercise->exerciseVariation()->get();
    //     $pageTitle = $exercise->title.' Variations List';
    //     return view('admin.exerciseVariations', compact('exercise', 'pageTitle', 'exerciseVariation', 'setting'));
    // }

    // public function storeVariation(Request $request) {
    //     $validator = Validator::make($request->all(), [
    //         'variation_name' => ['required', 'string', 'max:60'],
    //         'duration' => ['required', 'string', 'max:60'],
    //         'reps' => ['required', 'numeric', 'max:60'],
    //         'rest_duration' => ['required', 'string', 'max:60'],
    //     ]);

    //     if(request('save') == "Post Variation") {
    //         $exerciseVariationsData = array('exercise_code' => request('exCode'), 'variation_name' => request('variation_name'), 'duration' => request('duration'), 'reps' => request('reps'), 'rest_duration' => request('rest_duration'));

    //         if(ExerciseVariations::create($exerciseVariationsData)) {
    //             return response()->json(['success'=>'Variation Posted Successfully.']);
    //         } else {
    //             return response()->json(['error'=>'Some error occoured. plz try again']);
    //         }
    //     } else {
    //         $id = request('id');

    //         $exerciseVariationsData = array('exercise_code' => request('exCode'), 'variation_name' => request('variation_name'), 'duration' => request('duration'), 'reps' => request('reps'), 'rest_duration' => request('rest_duration'));

    //         $res1 = ExerciseVariations::where('id', $id)->update($exerciseVariationsData);

    //         if($res1) {
    //             return response()->json(['success' => 'Variation Updated Successfully.']);
    //         } else {
    //             return response()->json(['error' => 'Some error occoured. plz try again']);
    //         }
    //     }
    // }

    // public function edit_variation(Request $request) {
    //     $evId = request('evId');
    //     $exerciseVariation = ExerciseVariations::where('id', $evId)->get()->first();
    //     return \Response::json($exerciseVariation);
    // }

    /**
     * @group  Exercise
     * 
     * @authenticated
     *
     * API for getting featured category exercises
     * 
     * @response  {
     *  "success": true,
     *     "data": [{
     *          "categoryId": "4",
     *          "categoryName": "Misc Fee",
     *          "exercises": [{
     *              "id": 1,
     *              "title": "Full Body Blaster",
     *              "based_on": "reps",
     *              "duration": "10:30",
     *              "reps": 5,
     *              "focus_area": [
     *                  "Full Body"
     *              ],
     *              "specific_muscles": [
     *                  "Core",
     *                  "Shoulders"
     *              ],
     *              "good_for": [
     *                  "vdzvz"
     *              ],
     *              "type": [
     *                  "warmup",
     *                  "exercise"
     *              ],
     *              "level": "Advanced",
     *              "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/exercises/images/1625552652.png"
     *          }]
     *    }]
     * }
     * 
     * @response  401 {
     *  "success": false,
     *  "message": "Token is Invalid."
     * }  
     * 
     * @response  403 {
     *  "success": false,
     *  "message": "Token is Expired."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "User Not Found."
     * }   
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Category not found."
     * }   
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Exercises not found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getFeaturedCategoryExercise(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $featuredCategory = Category::select(DB::raw('group_concat(id) as ids'), DB::raw('group_concat(name) as names'))->where('featured', 1)->get()->first();

            if(empty($featuredCategory['ids'])) {
                return response()->json(['success' =>  false, 'message' => 'Category not found.'], 404);
            }
            
            $categoryIds = explode(',', $featuredCategory['ids']);
            $categoryNames = explode(',', $featuredCategory['names']);

            $data = array();

            foreach($categoryIds as $m => $catId) {
                $data[$m]['categoryId'] = $categoryIds[$m];
                $data[$m]['categoryName'] = $categoryNames[$m];
                $exercises = Exercises::select('id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->where('visible', 1)->with(array('equipments' => function($query) {
                    $query->select('name');
                }))->where('category_id', $categoryIds[$m])->take(10)->get();
                
                foreach($exercises as $k => $ex) {
                    $focus_area = explode(',', $ex['focus_area']);
                    $specific_muscles = explode(',', $ex['specific_muscles']);
                    $good_for = explode(',', $ex['good_for']);
                    $type = explode(',', $ex['type']);
                    $level = explode(',', $ex['level']);
                    $ex['focus_area'] = $focus_area;
                    $ex['specific_muscles'] = $specific_muscles;
                    $ex['good_for'] = $good_for;
                    $ex['type'] = $type;
                    $ex['level'] = $level;
                }

                $data[$m]['exercises'] = $exercises;
            }
            
            if(empty($data)) {
                return response()->json(['success' =>  false, 'message' => 'Exercises not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'data' => $data], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => 'Token is Expired.'], 403);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Exercise
     * 
     * @authenticated
     *
     * API for getting All exercises
     * 
     * @response  {
     *  "exercises": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "based_on": "reps",
     *      "duration": "10:30",
     *      "reps": 5,
     *      "focus_area": "Full Body",
     *      "specific_muscles": "Core, Shoulders",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/exercises/images/1623067648.jpg"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/exercise/all?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/exercise/all?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/exercise/all",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 4,
     *    "total": 4
     *   },
     *   "success": true
     * }
     * 
     * @response  401 {
     *  "success": false,
     *  "message": "Token is Invalid."
     * }  
     * 
     * @response  403 {
     *  "success": false,
     *  "message": "Token is Expired."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Exercise Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getAllExercises(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $exercises = Exercises::select('id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->with(array('equipments' => function($query) {
                $query->select('name');
            }))->paginate(10); 

            foreach($exercises as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $type = explode(',', $ex['type']);
                $level = explode(',', $ex['level']);
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['type'] = $type;
                $ex['level'] = $level;
            }

            if($exercises->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Exercises not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'exercises' => $exercises], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Exercise
     * 
     * @authenticated
     *
     * API for getting single exercises
     * 
     * @urlParam  id required The ID of the exercise.
     * 
     * @response  {
     *  "success": true,
     *  "exercise": {
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "code": "FBB21",
     *      "slug": "full-body-blaster",
     *      "category_id": 2,
     *      "duration": "10:30",
     *      "instructions": "fvadfadfa",
     *      "description": "fadsfadfda",
     *      "video_link": "https://docs.google.com/spreadsheets/d/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM/edit#gid=0",
     *      "tip_video": "https://docs.google.com/spreadsheets/d/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM/edit#gid=0",
     *      "tip_video_thumbnail": "https://i.ytimg.com/vi/AGnRVWiDHco/hqdefault.jpg",
     *      "reps": "5",
     *      "focus_area": "Full Body",
     *      "specific_muscles": "Core, Shoulders",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "Notes": null,
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/exercises/images/1623067648.jpg",
     *      "tags": "exercise,health,nutrition",
     *      "created_at": "2021-05-13 06:56:08",
     *      "updated_at": "2021-06-07 12:07:28"
     *  }
     * }
     * 
     * @response  401 {
     *  "success": false,
     *  "message": "Token is Invalid."
     * }  
     * 
     * @response  403 {
     *  "success": false,
     *  "message": "Token is Expired."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Exercise Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getSingleExercise(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $exercise = Exercises::with('category', 'equipments')->where('id', request('id'))->get()->first(); 

            if(empty($exercise)) {
                return response()->json(['success' =>  false, 'message' => 'Exercise not found.'], 404);
            }

            $focus_area = explode(',', $exercise['focus_area']);
            $specific_muscles = explode(',', $exercise['specific_muscles']);
            $good_for = explode(',', $exercise['good_for']);
            $type = explode(',', $exercise['type']);
            $level = explode(',', $exercise['level']);
            $tags = explode(',', $exercise['tags']);
            // $instructions = strip_tags(preg_replace('/\s+/', '', $exercise['instructions']));
            // $description = strip_tags(preg_replace('/\s+/', '', $exercise['description']));
            $exercise['focus_area'] = $focus_area;
            $exercise['specific_muscles'] = $specific_muscles;
            $exercise['good_for'] = $good_for;
            $exercise['type'] = $type;
            $exercise['level'] = $level;
            $exercise['tags'] = $tags;
            // $exercise['instructions'] = $instructions;
            // $exercise['description'] = $description;

            if(empty($exercise)) {
                return response()->json(['success' =>  false, 'message' => 'Exercise not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'exercise' => $exercise], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  playlist
     * 
     * @authenticated
     *
     * API for getting Saved exercises
     * 
     * @bodyParam  playlistId integer required The id of the playlist. Example: 1
     * 
     * @response  {
     *  "exercises": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "based_on": "reps",
     *      "duration": "10:30",
     *      "reps": 5,
     *      "focus_area": "Full Body",
     *      "specific_muscles": "Core, Shoulders",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/exercises/images/1623067648.jpg"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/exercises?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/exercises?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/exercises",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 4,
     *    "total": 4
     *   },
     *   "success": true
     * }
     * 
     * @response  401 {
     *  "success": false,
     *  "message": "Token is Invalid."
     * }  
     * 
     * @response  403 {
     *  "success": false,
     *  "message": "Token is Expired."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Exercise Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function playlistSavedExercises(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'playlistId' => ['required', 'numeric'],
            ]);

            if ($validator->fails()) {
                return response()->json(['success' =>  false, 'message' => $validator->messages()->first()], 404);
            }
            
            $playlist = UserPlaylist::find(request('playlistId'));

            if(empty($playlist)) { 
                return response()->json(['success' =>  false, 'message' => 'Playlist not found.'], 404);
            }
            
            $savedExercises = $playlist->savedExercises()->paginate(10);

            foreach($savedExercises as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $type = explode(',', $ex['type']);
                $tags = explode(',', $ex['tags']);
                $level = explode(',', $ex['level']);
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['type'] = $type;
                $ex['tags'] = $tags;
                $ex['level'] = $level;
            }

            if($savedExercises->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Exercises not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'exercises' => $savedExercises], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Exercise
     * 
     * @authenticated
     *
     * API for getting Favourite exercises
     * 
     * @response  {
     *  "exercises": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "based_on": "reps",
     *      "duration": "10:30",
     *      "reps": 5,
     *      "focus_area": "Full Body",
     *      "specific_muscles": "Core, Shoulders",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/exercises/images/1623067648.jpg"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/exercises?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/exercises?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/exercises",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 4,
     *    "total": 4
     *   },
     *   "success": true
     * }
     * 
     * @response  401 {
     *  "success": false,
     *  "message": "Token is Invalid."
     * }  
     * 
     * @response  403 {
     *  "success": false,
     *  "message": "Token is Expired."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Exercise Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function userFavouriteExercises(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $favouriteExercises = $user->favouriteExercises()->groupBy('exercise_id')->paginate(10);

            foreach($favouriteExercises as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $type = explode(',', $ex['type']);
                $tags = explode(',', $ex['tags']);
                $level = explode(',', $ex['level']);
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['type'] = $type;
                $ex['tags'] = $tags;
                $ex['level'] = $level;
            }

            if($favouriteExercises->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Exercises not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'exercises' => $favouriteExercises], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Exercise
     * 
     * @authenticated
     *
     * API for getting recent exercises
     * 
     * @response  {
     *  "exercises": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "based_on": "reps",
     *      "duration": "10:30",
     *      "reps": 5,
     *      "focus_area": "Full Body",
     *      "specific_muscles": "Core, Shoulders",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/exercises/images/1623067648.jpg"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/exercises?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/exercises?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/exercises",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 4,
     *    "total": 4
     *   },
     *   "success": true
     * }
     * 
     * @response  401 {
     *  "success": false,
     *  "message": "Token is Invalid."
     * }  
     * 
     * @response  403 {
     *  "success": false,
     *  "message": "Token is Expired."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Exercise Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function userRecentExercises(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $recentExercises = $user->recentExercises()->groupBy('exercise_id')->paginate(10);

            foreach($recentExercises as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $type = explode(',', $ex['type']);
                $tags = explode(',', $ex['tags']);
                $level = explode(',', $ex['level']);
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['type'] = $type;
                $ex['tags'] = $tags;
                $ex['level'] = $level;
            }

            if($recentExercises->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Exercises not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'exercises' => $recentExercises], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    public function paginate($items, $perPage, $page = null, $options = []) {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return $items;
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }
}
