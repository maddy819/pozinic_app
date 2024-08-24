<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\WorkoutsImport;
use App\Imports\WorkoutExerciseImport;
use App\Settings;
use App\Category;
use App\User;
use App\Workouts;
use App\Exercises;
use App\UserPlaylist;
use App\ExerciseWorkout;
use App\FocusArea;
use App\GoodFor;
use App\Muscles;
use JWTAuth;
use File;
use DB;
use App\UserRecent;
use App\UserFavourite;
use App\PlaylistSaved;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class WorkoutsController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $workouts = Workouts::all();
        $warmUps = Exercises::whereRaw("FIND_IN_SET('warmup',type)")->get();
        $postStreches = Exercises::whereRaw("FIND_IN_SET('poststrech',type)")->get();
        $focusAreas = FocusArea::where("workout", 1)->get();
        $goodFors = GoodFor::all();
        $muscles = Muscles::all();
        $pageTitle = 'Workouts';
        return view('admin.workouts', compact('setting', 'workouts', 'warmUps', 'postStreches', 'pageTitle', 'focusAreas', 'goodFors', 'muscles'));
    }

    public function store_workout(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'duration' => ['required', 'array', 'min:1'],
            'instruction' => ['required', 'string'],
            'focus_area' => ['required', 'array', 'min:1'],
            'good_for' => ['required', 'array', 'min:1'],
            'level' => ['required', 'array', 'min:1'],
            'image' => ['image', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
            'equipments' => ['required', 'array', 'min:1'],
            'warm_ups' => ['array', 'min:1']
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Workout") {
            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefile->move('uploads/workouts/images/', $imagefilename);
            } else {
                $imagefilename = 'default-placeholder.png';
            }

            $wCount = Workouts::get()->count();
            
            if($wCount > 0) {
                $last = Workouts::latest('id')->first()->id;
                $code = "POZWT".($last + 1);
            } else {
                $code = "POZWT1";
            }
    
            $workoutData = array('code' => $code, 'title' => request('title'), 'duration' => implode(',',request('duration')), 'slug' => Str::slug(request('title')), 'instructions' => request('instruction'), 'image' => $imagefilename, 'description' => request('description'), 'focus_area' => implode(',', request('focus_area')), 'level' => implode(',',request('level')), 'type' => request('type'), 'good_for' => implode(',', request('good_for')), 'calories_burned' => request('calories_burned'), 'video_link' => request('video_link'), 'tags' => request('tags'), 'visible' => request('visible'), 'category_id' => request('category'));

            $workout = Workouts::create($workoutData);

            if($workout) {
                $workout->equipments()->attach(request('equipments'));
                // $workout->warmups()->attach(request('warm_ups'));
                // $post_streches = request('post_streches');

                // if(isset($post_streches)) {
                //     $workout->poststreches()->attach($post_streches);
                // }
                
                return response()->json(['success'=>'Workout Posted Successfully.']);
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
                $image->move('uploads/workouts/images/', $new_image);
            }

            $workoutData = array('title' => request('title'), 'duration' => implode(',',request('duration')), 'slug' => Str::slug(request('title')), 'instructions' => request('instruction'), 'image' => $new_image, 'description' => request('description'), 'focus_area' => implode(',', request('focus_area')), 'level' => implode(',',request('level')), 'type' => request('type'), 'good_for' => implode(',', request('good_for')), 'calories_burned' => request('calories_burned'), 'video_link' => request('video_link'), 'tags' => request('tags'), 'visible' => request('visible'), 'category_id' => request('category'));

            $res1 = Workouts::where('id', $id)->update($workoutData);

            if($res1) {
                $workout = Workouts::find($id);
                $workout->equipments()->sync(request('equipments'));
                $wdu = explode(',', $workout->duration);
                $workoutExercise = ExerciseWorkout::where('workout_id', $workout->id)->get();

                foreach($workoutExercise as $we) {
                    if(!in_array($we->duration, $wdu)){
                        ExerciseWorkout::where('id', $we->id)->delete();
                    }
                }
                
                return response()->json(['success' => 'Workout Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function importWorkouts(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Please upload a valid CSV file..!');
        }

        $import = Excel::import(new WorkoutsImport, request()->file('file'));

        if($import) {
            return redirect()->back()->with('success', 'Workouts Imported Successfully..!');
        }

        return redirect()->back()->with('error', 'Error in Importing..!');
    }

    public function edit_workout(Request $request) {
        $wkId = request('wkId');
        $workout = Workouts::with('equipments', 'warmups', 'poststreches')->where('id', $wkId)->get()->first();
        return \Response::json($workout);
    }

    public function deleteWorkout(Request $request) {
        $ids = explode(",", request('id'));
        DB::beginTransaction();

        try {
            foreach($ids as $id) {
                $workout = Workouts::find($id);
                $res = Workouts::where('id', $id)->delete();
                ExerciseWorkout::where('workout_id', $id)->delete();
                UserRecent::where('workout_id', $id)->delete();
                UserFavourite::where('workout_id', $id)->delete();
                PlaylistSaved::where('workout_id', $id)->delete();
                $destinationPath = public_path("uploads/workouts/images/".$workout['image']);
                File::delete($destinationPath);
            }

            DB::commit();
            return redirect()->back()->with('success', 'Workout Deleted Successfully.');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', 'Error Deleting Workouts.');
        }
    }

    public function makeFeatured(Request $request) {
        $wkid = (int)request('wkid');
        $duration = (int)request('duration');
        $cat = Category::where('featured_for', 2)->get()->first();
        $updData = array('category_id' => $cat->id);
        $exWk = ExerciseWorkout::where('workout_id', $wkid)->where('duration', $duration)->update($updData);
        $wkupd = Workouts::where('id', $wkid)->update($updData);
        return redirect()->back()->with('success', 'Workout Featured Successfully...');
    }

    public function exercises(Request $request) {
        $wkid = (int)request('wkid');
        $duration = (int)request('duration');
        $workout = Workouts::find($wkid);
        //$category = ExerciseWorkout::where('workout_id', $wkid)->where('duration', $duration)->get()->first()->category_id;
        $setting = Settings::all()->first();
        $workoutexercises = $workout->exercises->where('pivot.duration', $duration);
        $exercises = Exercises::whereRaw("FIND_IN_SET('exercise',type)")->get();
        $allExercises = Exercises::all();
        $warmups = Exercises::whereRaw("FIND_IN_SET('warmup',type)")->get();
        $poststreches = Exercises::whereRaw("FIND_IN_SET('poststrech',type)")->get();
        $pageTitle = $workout->title.' Details (Duration - '.$duration.' Mins)';
        return view('admin.workoutExercises', compact('workout', 'duration', 'exercises', 'allExercises', 'warmups', 'poststreches', 'pageTitle', 'workoutexercises', 'setting'));
    }

    public function workoutExercisesImport(Request $request) {
        $wkid = (int)request('wkid');
        $importToDuration = request('importToDuration');
        $importFromDuration = request('importFromDuration');

        if($importToDuration == $importFromDuration) {
            return redirect()->back()->with('error', 'You cannot import exercises from same workout duration..');
        }

        $exercises = ExerciseWorkout::where('workout_id', $wkid)->where('duration', $importFromDuration)->get();

        if($exercises->isEmpty()) {
            return redirect()->back()->with('error', 'Imported workout is empty..');
        }

        $exs = array();

        foreach($exercises as $ex) {
            $exi['workout_id'] = $wkid;
            $exi['exercise_id'] = $ex->exercise_id;
            $exi['duration'] = $importToDuration;
            $exi['variation_name'] = $ex->variation_name;
            $exi['sets'] = $ex->sets;
            $exi['based_on'] = $ex->based_on;
            $exi['ex_duration'] = $ex->ex_duration;
            $exi['ex_reps'] = $ex->ex_reps;
            $exi['rest_duration'] = $ex->rest_duration;
            array_push($exs, $exi);
        }

        $res = ExerciseWorkout::insert($exs);

        if($res) {
            return redirect()->back()->with('success', 'Workout Imported Successfully...');
        } else {
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again..');
        }
    }

    // public function exercisesVariationList(Request $request) {
    //     $duration = request('duration');
    //     $exId = request('exId');
    //     $workout = Workouts::find(request('wkId'));
    //     $setting = Settings::all()->first();
    //     $workoutexercises = $workout->exercises->where('pivot.duration', $duration)->whereNotIn('pivot.id', [$exId]);
    //     $exercises = Exercises::whereRaw("FIND_IN_SET('exercise',type)")->get();
    //     $pageTitle = $workout->title.' Exercises List (Duration - '.$duration.' Mins)';
    //     return view('admin.workoutExercisesVariation', compact('workout', 'duration', 'exercises', 'pageTitle', 'workoutexercises', 'setting'));
    // }

    public function delete_workout_exercise(Request $request) {
        $ids = explode(",", request('id'));
        $wkid = request('wkid');
        $duration = request('duration');

        foreach($ids as $id) {
            $res = ExerciseWorkout::where('id', $id)->delete();
        }
        
        return redirect()->route('admin-workout-exercises-variation', ['wkid' => $wkid, 'duration' => $duration])->with('success', 'Workout Exercise Deleted Successfully...');
    }

    public function storeExercise(Request $request) {
        $validator = Validator::make($request->all(), [
            'exid' => ['required'],
            'duration' => ['required', 'integer'],
            'ex_duration' => ['required_if:based_on,duration'],
            'ex_reps' => ['required_if:based_on,reps'],
            // 'sets' => ['required', 'integer'],
            // 'rest_duration' => ['required', 'integer'],
        ]);
        
        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Save") {
            $workoutExerciseData = array('workout_id' => request('wkid'), 'exercise_id' => request('exid'), 'variation_name' => request('variation_name'), 'duration' => request('duration'), 'sets' => request('sets'), 'based_on' => request('based_on'), 'ex_duration' => request('ex_duration'), 'ex_reps' => request('ex_reps'), 'rest_duration' => request('rest_duration'));
            
            if(ExerciseWorkout::create($workoutExerciseData)) {
                return response()->json(['success'=>'Exercise Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');
            $workoutExerciseData = array('variation_name' => request('variation_name'), 'duration' => request('duration'), 'sets' => request('sets'), 'based_on' => request('based_on'), 'ex_duration' => request('ex_duration'), 'ex_reps' => request('ex_reps'), 'rest_duration' => request('rest_duration'));

            $res1 = ExerciseWorkout::where('id', $id)->update($workoutExerciseData);
            
            if($res1) {
                return response()->json(['success'=>'Exercise Updated Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        }
    }

    public function storeCategory(Request $request) {
        $workout_id = request('workout_id');
        $duration = request('duration');
        $category_id = request('category_id');

        $exerciseWorkouts = ExerciseWorkout::where('workout_id', $workout_id)->where('duration', $duration)->get();

        if(!$exerciseWorkouts->isEmpty()) {
            $updatedData = array('category_id' => $category_id);
            $res = ExerciseWorkout::where('workout_id', $workout_id)->where('duration', $duration)->update($updatedData);
            if($res){
                return response()->json(['success'=>'Category Updated Successfully..!']);
            } else {
                return response()->json($res);
            }
            
        } else {
            return response()->json(['success'=>'Exercise Updated Successfully..!']);
        }
    }

    public function importWorkoutsExercises(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Please upload a valid CSV file..!');
        }

        $import = Excel::import(new WorkoutExerciseImport, request()->file('file'));

        if($import) {
            return redirect()->back()->with('success', 'Exercises Imported Successfully..!');
        }

        return redirect()->back()->with('error', 'Error in Importing..!');
    }

    public function edit_exercise(Request $request) {
        $evId = request('evId');
        $exercise = ExerciseWorkout::with('exercise')->where('id', $evId)->get()->first();
        return \Response::json($exercise);
    }

    /**
     * @group  Workout
     * 
     * API for getting All workouts
     * 
     * @authenticated
     * 
     * @response  {
     *  "workouts": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "duration": "10:30",
     *      "focus_area": "Full Body",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/workouts/images/1623067648.jpg",
     *      "good_for": "vdzvz",
     *      "calories_burned": 56
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/workouts/all?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/workouts/all?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/workouts/all",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 4,
     *    "total": 4
     *  },
     *  "success": true
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
     *  "message": "Workouts Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getAllWorkouts(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $Workouts = Workouts::select('id', 'title', 'duration', 'focus_area', 'level', 'image', 'good_for', 'calories_burned')->where('visible', 1)->with(array('equipments' => function($query) {
                $query->select('name');
            }))->paginate(10); 

            foreach($Workouts as $k => $wk) {
                $focus_area = explode(',', $wk['focus_area']);
                $good_for = explode(',', $wk['good_for']);
                $level = explode(',', $wk['level']);
                $wk['level'] = $level;
                $wk['focus_area'] = $focus_area;
                $wk['good_for'] = $good_for;
            }

            if($Workouts->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Workouts not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'workouts' => $Workouts], 200);
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
     * @group  Workout
     * 
    * API for getting single workouts
     * 
     * @authenticated
     * 
     * @urlParam  id required The ID of the workout.
     * 
     * @response  {
     *  "success": true,
     *  "rest_durations": ["05:22","05:22","05:22","05:22"],
     *  "workout": {
     *      "id": 1,
     *      "code": "FBB21",
     *      "title": "Full Body Blaster",
     *      "slug": "full-body-blaster",
     *      "duration": "10:30",
     *      "rest_duration": "05:22",
     *      "instructions": "fvadfadfa",
     *      "description": "fadsfadfda",
     *      "type": "warmup,exercise",
     *      "warm_ups": null,
     *      "post_streches": null,
     *      "focus_area": "Full Body",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/workouts/images/1623067648.jpg",
     *      "good_for": "vdzvz",
     *      "calories_burned": 56,
     *      "video_link": "https://docs.google.com/spreadsheets/d/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM/edit#gid=0",
     *      "tags": "exercise,health,nutrition",
     *      "visible": 1,
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
     *  "message": "Workout Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    // public function getSingleworkout(Request $request) {
    //     try {
    //         if (! $user = JWTAuth::parseToken()->authenticate()) {
    //             return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
    //         }

    //         $level = "Beginner";

    //         $workout = Workouts::with('equipments', 'warmups', 'poststreches', 'exercises')->where('id', request('id'))->get()->first(); 

    //         //return response()->json($workout);

    //         if(empty($workout)) {
    //             return response()->json(['success' =>  false, 'message' => 'Workout not found.'], 404);
    //         }

    //         $focus_area = explode(',', $workout['focus_area']);
    //         $good_for = explode(',', $workout['good_for']);
    //         $tags = explode(',', $workout['tags']);
    //         // $instructions = strip_tags(preg_replace('/\s+/', '', $workout['instructions']));
    //         // $description = strip_tags(preg_replace('/\s+/', '', $workout['description']));
    //         $workout['focus_area'] = $focus_area;
    //         $workout['good_for'] = $good_for;
    //         $workout['tags'] = $tags;
    //         // $workout['instructions'] = $instructions;
    //         // $workout['description'] = $description;

    //         foreach($workout->exercises as $k => $ex) {
    //             $focus_area = explode(',', $ex['focus_area']);
    //             $specific_muscles = explode(',', $ex['specific_muscles']);
    //             $good_for = explode(',', $ex['good_for']);
    //             $type = explode(',', $ex['type']);
    //             $tags = explode(',', $ex['tags']);
    //             // $instructions = strip_tags(preg_replace('/\s+/', '', $ex['instructions']));
    //             // $description = strip_tags(preg_replace('/\s+/', '', $ex['description']));
    //             $ex['focus_area'] = $focus_area;
    //             $ex['specific_muscles'] = $specific_muscles;
    //             $ex['good_for'] = $good_for;
    //             $ex['type'] = $type;
    //             $ex['tags'] = $tags;
    //             // $ex['instructions'] = $instructions;
    //             // $ex['description'] = $description;
    //         }

    //         foreach($workout->poststreches as $k => $ps) {
    //             $focus_area = explode(',', $ps['focus_area']);
    //             $specific_muscles = explode(',', $ps['specific_muscles']);
    //             $good_for = explode(',', $ps['good_for']);
    //             $type = explode(',', $ps['type']);
    //             $tags = explode(',', $ps['tags']);
    //             // $instructions = strip_tags(preg_replace('/\s+/', '', $ps['instructions']));
    //             // $description = strip_tags(preg_replace('/\s+/', '', $ps['description']));
    //             $ps['focus_area'] = $focus_area;
    //             $ps['specific_muscles'] = $specific_muscles;
    //             $ps['good_for'] = $good_for;
    //             $ps['type'] = $type;
    //             $ps['tags'] = $tags;
    //             // $ps['instructions'] = $instructions;
    //             // $ps['description'] = $description;
    //         }

    //         foreach($workout->warmups as $k => $wm) {
    //             $focus_area = explode(',', $wm['focus_area']);
    //             $specific_muscles = explode(',', $wm['specific_muscles']);
    //             $good_for = explode(',', $wm['good_for']);
    //             $type = explode(',', $wm['type']);
    //             $tags = explode(',', $wm['tags']);
    //             // $instructions = strip_tags(preg_replace('/\s+/', '', $wm['instructions']));
    //             // $description = strip_tags(preg_replace('/\s+/', '', $wm['description']));
    //             $wm['focus_area'] = $focus_area;
    //             $wm['specific_muscles'] = $specific_muscles;
    //             $wm['good_for'] = $good_for;
    //             $wm['type'] = $type;
    //             $wm['tags'] = $tags;
    //             // $wm['instructions'] = $instructions;
    //             // $wm['description'] = $description;
    //         }

    //         if(empty($workout)) {
    //             return response()->json(['success' =>  false, 'message' => 'Workout not found.'], 404);
    //         } else {
    //             return response()->json(['success' =>  true, 'rest_durations' => $workout->exercises->pluck('rest_duration'), 'workout' => $workout], 200);
    //         }
    //     } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
    //         return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
    //     } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
    //         return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
    //     } catch(\Illuminate\Database\QueryException $e){ 
    //         return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
    //     } catch (\Exception $e) {
    //         return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
    //     }
    // }

    /**
     * @group  Workout
     * 
     * API for getting single workouts By Variation
     * 
     * @authenticated
     * 
     * @urlParam id required The ID of the workout.
     * @bodyParam duration integer required The duration for the workout.
     * 
     * @response  {
     *  "success": true,
     *  "rest_durations": ["05:00"],
     *  "workout": {
     *      "id": 1,
     *      "code": "FBB21",
     *      "title": "Full Body Blaster",
     *      "slug": "full-body-blaster",
     *      "duration": "10:30",
     *      "rest_duration": "05:22",
     *      "instructions": "fvadfadfa",
     *      "description": "fadsfadfda",
     *      "type": "warmup,exercise",
     *      "warm_ups": null,
     *      "post_streches": null,
     *      "focus_area": "Full Body",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/workouts/images/1623067648.jpg",
     *      "good_for": "vdzvz",
     *      "calories_burned": 56,
     *      "video_link": "https://docs.google.com/spreadsheets/d/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM/edit#gid=0",
     *      "tags": "exercise,health,nutrition",
     *      "visible": 1,
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
     *  "message": "Workout Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getSingleWorkoutByVariation(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $duration = request('duration');

            $workout = Workouts::with(['equipments', 'warmups', 'poststreches', 'exercises' => function($q) use($duration){
                $q->where('exercise_workout.duration', $duration);
            }])->where('id', request('id'))->where('visible', 1)->get()->first(); 

            if(empty($workout)) {
                return response()->json(['success' =>  false, 'message' => 'Workout not found.'], 404);
            }

            $focus_area = explode(',', $workout['focus_area']);
            $good_for = explode(',', $workout['good_for']);
            $tags = explode(',', $workout['tags']);
            // $instructions = strip_tags(preg_replace('/\s+/', '', $workout['instructions']));
            // $description = strip_tags(preg_replace('/\s+/', '', $workout['description']));
            $level = explode(',', $workout['level']);
            $workout['level'] = $level;
            $workout['focus_area'] = $focus_area;
            $workout['good_for'] = $good_for;
            $workout['tags'] = $tags;
            $workout['duration'] = $duration;
            // $workout['instructions'] = $instructions;
            // $workout['description'] = $description;

            foreach($workout->exercises as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $type = explode(',', $ex['type']);
                $tags = explode(',', $ex['tags']);
                // $instructions = strip_tags(preg_replace('/\s+/', '', $ex['instructions']));
                // $description = strip_tags(preg_replace('/\s+/', '', $ex['description']));
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['type'] = $type;
                $ex['tags'] = $tags;
                $ex['level'] = $ex->level;
                $ex['based_on'] = (!empty($ex->pivot->based_on)) ? $ex->pivot->based_on : $ex->based_on;
                $ex['duration'] = (!empty($ex->pivot->ex_duration)) ? $ex->pivot->ex_duration : $ex->duration;
                $ex['reps'] = (!empty($ex->pivot->ex_reps)) ? $ex->pivot->ex_reps : $ex->reps;
                $ex['sets'] = (!empty($ex->pivot->sets)) ? $ex->pivot->sets : 0;
                $ex['rest_duration'] = (!empty($ex->pivot->rest_duration)) ? $ex->pivot->rest_duration : 0;
                //unset($ex->pivot);
                // $ex['instructions'] = $instructions;
                // $ex['description'] = $description;
            }

            foreach($workout->poststreches as $k => $ps) {
                $focus_area = explode(',', $ps['focus_area']);
                $specific_muscles = explode(',', $ps['specific_muscles']);
                $good_for = explode(',', $ps['good_for']);
                $type = explode(',', $ps['type']);
                $tags = explode(',', $ps['tags']);
                // $instructions = strip_tags(preg_replace('/\s+/', '', $ps['instructions']));
                // $description = strip_tags(preg_replace('/\s+/', '', $ps['description']));
                $ps['focus_area'] = $focus_area;
                $ps['specific_muscles'] = $specific_muscles;
                $ps['good_for'] = $good_for;
                $ps['type'] = $type;
                $ps['tags'] = $tags;
                $ps['level'] = $ps->level;
                $ps['based_on'] = (!empty($ps->pivot->based_on)) ? $ps->pivot->based_on : $ps->based_on;
                $ps['duration'] = (!empty($ps->pivot->ex_duration)) ? $ps->pivot->ex_duration : $ps->duration;
                $ps['reps'] = (!empty($ps->pivot->ex_reps)) ? $ps->pivot->ex_reps : $ps->reps;
                $ps['sets'] = (!empty($ps->pivot->sets)) ? $ps->pivot->sets : 0;
                $ps['rest_duration'] = (!empty($ps->pivot->rest_duration)) ? $ps->pivot->rest_duration : 0;
                // $ps['instructions'] = $instructions;
                // $ps['description'] = $description;
            }

            foreach($workout->warmups as $k => $wm) {
                $focus_area = explode(',', $wm['focus_area']);
                $specific_muscles = explode(',', $wm['specific_muscles']);
                $good_for = explode(',', $wm['good_for']);
                $type = explode(',', $wm['type']);
                $tags = explode(',', $wm['tags']);
                // $instructions = strip_tags(preg_replace('/\s+/', '', $wm['instructions']));
                // $description = strip_tags(preg_replace('/\s+/', '', $wm['description']));
                $wm['focus_area'] = $focus_area;
                $wm['specific_muscles'] = $specific_muscles;
                $wm['good_for'] = $good_for;
                $wm['type'] = $type;
                $wm['tags'] = $tags;
                $wm['level'] = $wm->level;
                $wm['based_on'] = (!empty($wm->pivot->based_on)) ? $wm->pivot->based_on : $wm->based_on;
                $wm['duration'] = (!empty($wm->pivot->ex_duration)) ? $wm->pivot->ex_duration : $wm->duration;
                $wm['reps'] = (!empty($wm->pivot->ex_reps)) ? $wm->pivot->ex_reps : $wm->reps;
                $wm['sets'] = (!empty($wm->pivot->sets)) ? $wm->pivot->sets : 0;
                $wm['rest_duration'] = (!empty($wm->pivot->rest_duration)) ? $wm->pivot->rest_duration : 0;
                // $wm['instructions'] = $instructions;
                // $wm['description'] = $description;
            }

            if(empty($workout)) {
                return response()->json(['success' =>  false, 'message' => 'Workout not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'rest_durations' => $workout->exercises->pluck('rest_duration'), 'workout' => $workout], 200);
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
     * @group  Workout
     * 
     * API for getting single workout duration
     * 
     * @authenticated
     * 
     * @urlParam  id required The ID of the workout.
     * 
     * @response  {
     *  "success": true,
     *  "workout": ["Beginner", "Intermediate"]
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
     *  "message": "Workout Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getWorkoutDuration(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $durations = Workouts::where('id', request('id'))->get()->pluck('duration')->first();
            $durations = explode(',', $durations);

            if(count($durations) > 0) {
                return response()->json(['success' =>  true, 'durations' => $durations], 200);
            } else {
                return response()->json(['success' =>  false, 'message' => 'durations not found.'], 404);
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
     * API for getting Saved workouts
     * 
     * @authenticated
     * 
     * @bodyParam  playlistId integer required The id of the playlist. Example: 1
     * 
     * @response  {
     *  "workouts": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "duration": "10:30",
     *      "focus_area": "Full Body",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/workouts/images/1623067648.jpg",
     *      "good_for": "vdzvz",
     *      "calories_burned": 56
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/playlist/saved/workouts?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/playlist/saved/workouts?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/playlist/saved/workouts",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 4,
     *    "total": 4
     *  },
     *  "success": true
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
     *  "message": "Workouts Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function playlistSavedWorkouts(Request $request) {
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

            $savedWorkouts = $playlist->savedWorkouts()->paginate(10);

            foreach($savedWorkouts as $k => $wk) {
                $focus_area = explode(',', $wk['focus_area']);
                $good_for = explode(',', $wk['good_for']);
                $tags = explode(',', $wk['tags']);
                $level = explode(',', $wk['level']);
                $wk['level'] = $level;
                $wk['focus_area'] = $focus_area;
                $wk['good_for'] = $good_for;
                $wk['tags'] = $tags;
            }

            if($savedWorkouts->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Workout not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'workouts' => $savedWorkouts], 200);
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
     * @group  Workout
     * 
     * API for getting Favourite workouts
     * 
     * @authenticated
     * 
     * @response  {
     *  "workouts": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "duration": "10:30",
     *      "focus_area": "Full Body",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/workouts/images/1623067648.jpg",
     *      "good_for": "vdzvz",
     *      "calories_burned": 56
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/favourite/workouts?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/favourite/workouts?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/favourite/workouts",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 4,
     *    "total": 4
     *  },
     *  "success": true
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
     *  "message": "Workouts Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function userFavouriteWorkouts(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $favouriteWorkouts = $user->favouriteWorkouts()->groupBy('workout_id')->paginate(10);
            $data = array();

            foreach($favouriteWorkouts as $k => $wk) {
                $focus_area = explode(',', $wk['focus_area']);
                $good_for = explode(',', $wk['good_for']);
                $tags = explode(',', $wk['tags']);
                $level = explode(',', $wk['level']);
                $wk['level'] = $level;
                $wk['focus_area'] = $focus_area;
                $wk['good_for'] = $good_for;
                $wk['tags'] = $tags;
                array_push($data, $wk);
            }

            if($favouriteWorkouts->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Workout not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'workouts' => $favouriteWorkouts], 200);
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
     * @group  Workout
     * 
     * API for getting recent workouts
     * 
     * @authenticated
     * 
     * @response  {
     *  "workouts": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "duration": "10:30",
     *      "focus_area": "Full Body",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/workouts/images/1623067648.jpg",
     *      "good_for": "vdzvz",
     *      "calories_burned": 56
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/recent/workouts?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/recent/workouts?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/recent/workouts",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 4,
     *    "total": 4
     *  },
     *  "success": true
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
     *  "message": "Workouts Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function userRecentWorkouts(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $recentWorkouts = $user->recentWorkouts()->groupBy('workout_id')->paginate(10);
            $data = array();

            foreach($recentWorkouts as $k => $wk) {
                $focus_area = explode(',', $wk['focus_area']);
                $good_for = explode(',', $wk['good_for']);
                $tags = explode(',', $wk['tags']);
                $level = explode(',', $wk['level']);
                $wk['level'] = $level;
                $wk['focus_area'] = $focus_area;
                $wk['good_for'] = $good_for;
                $wk['tags'] = $tags;
                array_push($data, $wk);
            }

            if($recentWorkouts->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Workout not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'workouts' => $recentWorkouts], 200);
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
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }
}
