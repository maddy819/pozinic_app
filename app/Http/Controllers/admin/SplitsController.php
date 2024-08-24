<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\SplitsImport;
use App\Imports\SplitWorkoutImport;
use App\Settings;
use App\User;
use App\Splits;
use App\FocusArea;
use App\GoodFor;
use App\Muscles;
use App\Workouts;
use App\SplitWorkout;
use App\UserSplitSubscription;
use App\UserSplitProgress;
use App\UserPlaylist;
use App\UserRecent;
use App\UserFavourite;
use App\PlaylistSaved;
use JWTAuth;
use DB;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class SplitsController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $splits = Splits::where('visible', 1)->get();
        $focusAreas = FocusArea::where("split", 1)->get();
        $goodFors = GoodFor::all();
        $muscles = Muscles::all();
        $pageTitle = 'Splits';
        return view('admin.splits', compact('setting', 'splits', 'pageTitle', 'focusAreas', 'goodFors', 'muscles'));
    }

    public function store_split(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'instruction' => ['required', 'string'],
            'breath' => ['required', 'string'],
            'duration' => ['required', 'array', 'min:1'],
            'no_of_days' => ['required', 'string', 'max:60'],
            'good_for' => ['required', 'array', 'min:1'],
            'focus_area' => ['required', 'array', 'min:1'],
            'level' => ['required', 'array', 'min:1'],
            //'video_link' => ['required', 'string', 'url'],
            'image' => ['image', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
            'equipments' => ['required', 'array', 'min:1'],
            'no_of_days' => ['required', 'numeric']
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Split") {
            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefile->move('uploads/splits/images/', $imagefilename);
            } else {
                $imagefilename = url('uploads/default-placeholder.png');
            }

            $spCount = Splits::get()->count();
            
            if($spCount > 0) {
                $last = Splits::latest('id')->first()->id;
                $code = "POZSP".($last + 1);
            } else {
                $code = "POZSP1";
            }

            $splitData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'code' => $code, 'no_of_days' => request('no_of_days'), 'level' => implode(',',request('level')), 'image' => $imagefilename, 'good_for' => implode(',', request('good_for')), 'focus_area' => implode(',', request('focus_area')), 'duration' => implode(',', request('duration')), 'instructions' => request('instruction'), 'breath' => request('breath'), 'tags' => request('tags'), 'visible' => request('visible'), 'category_id' => request('category'));

            $splits = Splits::create($splitData);

            if($splits) {
                $splits->equipments()->attach(request('equipments'));
                return response()->json(['success'=>'Split Posted Successfully.']);
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
                $image->move('uploads/splits/images/', $new_image);
            }

            $splitData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'no_of_days' => request('no_of_days'), 'level' => implode(',',request('level')), 'good_for' => implode(',', request('good_for')), 'image' => $new_image, 'focus_area' => implode(',', request('focus_area')), 'duration' => implode(',', request('duration')), 'instructions' => request('instruction'), 'breath' => request('breath'), 'tags' => request('tags'), 'visible' => request('visible'), 'category_id' => request('category'));

            $res1 = Splits::where('id', $id)->update($splitData);

            if($res1) {
                $split = Splits::find($id);
                $split->equipments()->sync(request('equipments'));
                return response()->json(['success' => 'Split Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function importSplits(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Please upload a valid CSV file.');
        }

        Excel::import(new SplitsImport, request()->file('file'));
        return redirect()->back();
    }

    public function edit_split(Request $request) {
        $sid = request('sid');
        $split = Splits::with('equipments')->where('id', $sid)->get()->first();
        return \Response::json($split);
    }

    public function deleteSplit(Request $request) {
        $ids = explode(",", request('id'));
        DB::beginTransaction();
        
        try {
            foreach($ids as $id) {
                $res = Splits::where('id', $id)->delete();
                SplitWorkout::where('split_id', $id)->delete();
                UserRecent::where('split_id', $id)->delete();
                UserFavourite::where('split_id', $id)->delete();
                PlaylistSaved::where('split_id', $id)->delete();
            }
            
            DB::commit();
            return redirect()->back()->with('success', 'Split Deleted Successfully.');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', 'Error Deleting Splits.');
        }
    }

    public function workouts(Splits $split) {
        $spid = (int)request('spid');
        $duration = (int)request('duration');
        $setting = Settings::all()->first();
        $split = Splits::find($spid);
        $splitWorkouts = $split->workouts->where('pivot.duration', $duration);
        $splitWorkoutDays = $split->workouts->where('pivot.duration', $duration)->sum('pivot.total_days');
        $lastSplitWorkout = $split->workouts->where('pivot.duration', $duration)->last();
        $workouts = Workouts::whereRaw("find_in_set('".$duration."', duration)")->get();
        $pageTitle = $split->title.' '.$split->no_of_days.' days Details (Duration - '.$duration.' Mins)';
        return view('admin.splitWorkouts', compact('split', 'duration', 'splitWorkouts', 'splitWorkoutDays', 'lastSplitWorkout', 'workouts', 'pageTitle', 'setting'));
    }

    public function editSplitWorkout(Request $request) {
        $swId = request('swId');
        $splitWorkout = SplitWorkout::with('workout')->where('id', $swId)->get()->first();
        return \Response::json($splitWorkout);
    }

    public function deleteSplitWorkout(Request $request) {
        $ids = explode(",", request('id'));

        foreach($ids as $id) {
            $res = SplitWorkout::where('id', $id)->delete();
        }
        
        return redirect()->route('admin-split-workouts-variation', [request('spid'), request('duration')])->with('success', 'Split Workout Deleted Successfully...');
    }

    public function storeWorkout(Request $request) {
        if(request('save') == "Post Variation") {
            $validator = Validator::make($request->all(), [
                'spid' => ['required', 'numeric'],
                'wkid' => ['required', 'numeric'],
                'duration' => ['required', 'integer'],
                'start' => ['required', 'numeric'],
                'end' => ['required', 'numeric']
            ]);

            if ($validator->fails()) {
                return response()->json(['error'=> $validator->messages()->first()]);
            }

            if(request('start') > request('end')) {
                return response()->json(['error'=> 'starting day must be small than ending day.']);
            }

            $sw = SplitWorkout::where('split_id', request('spid'))->where('duration', request('duration'))->whereRaw("((starting_day = ".request('start')." or starting_day = ".request('end').") or (ending_day = ".request('start')." or ending_day = ".request('end')."))")->get()->count();

            if($sw > 0) {
                return response()->json(['error'=> 'Selected day already full.']);
            }

            $total_workout_days = (request('end') - request('start')) + 1;
            $split = Splits::find(request('spid'));
            $splitWorkoutDays = SplitWorkout::where('split_id', request('spid'))->where('duration', request('duration'))->sum('total_days');

            if($split->no_of_days < ($splitWorkoutDays + $total_workout_days)) {
                return response()->json(['error' => 'workout days becomes greater than split set number of days.']);
            }

            $splitWorkoutData = array('split_id' => request('spid'), 'workout_id' => request('wkid'), 'duration' => request('duration'), 'starting_day' => request('start'), 'ending_day' => request('end'), 'total_days' => $total_workout_days);

            if(SplitWorkout::create($splitWorkoutData)) {
                $upd_workout_days = $splitWorkoutDays + $total_workout_days;
                Splits::where('id', request('spid'))->update(array('configured_days' => $upd_workout_days));
                return response()->json(['success'=>'Workout Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $validator = Validator::make($request->all(), [
                'spid' => ['required', 'numeric'],
                'start' => ['required', 'numeric'],
                'end' => ['required', 'numeric']
            ]);

            if ($validator->fails()) {
                return response()->json(['error'=> $validator->messages()->first()]);
            }

            if(request('start') > request('end')) {
                return response()->json(['error'=> 'starting day must be small than ending day.']);
            }

            $id = request('id');
            $total_workout_days = (request('end') - request('start')) + 1;
            $split = Splits::find(request('spid'));
            $splitWorkoutDays = SplitWorkout::where('split_id', request('spid'))->where('duration', request('duration'))->sum('total_days');

            if($split->no_of_days < ($splitWorkoutDays + $total_workout_days)) {
                return response()->json(['error' => 'workout days becomes greater than split set number of days.']);
            }

            $splitWorkoutData = array('split_id' => request('spid'), 'starting_day' => request('start'), 'ending_day' => request('end'), 'total_days' => $total_workout_days);

            if(SplitWorkout::where('id', $id)->update($splitWorkoutData)) {
                return response()->json(['success'=>'Workout Updated Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        }
    }

    public function importWorkout(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
            'spid' => ['required', 'numeric'],
            'duration' => ['required', 'integer'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->messages()->first());
        }

        $import = Excel::import(new SplitWorkoutImport, request()->file('file'));

        if($import) {
            return redirect()->back()->with('success', 'Workouts Imported Successfully..!');
        }

        return redirect()->back()->with('error', 'Error in Importing..!');
    }

    /**
     * @group  Splits
     * 
     * @authenticated
     *
     * API for getting All splits
     * 
     * @response  {
     *  "splits": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/splits/images/1623067648.jpg",
     *      "focus_area": "Full Body",
     *      "duration": "10:30",
     *      "level": "Advanced",
     *      "frequency": 45,
     *      "length": 5
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/splits/all?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/splits/all?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/splits/all",
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
     *  "message": "splits Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getAllSplits() {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $splits = Splits::select('id', 'title', 'image', 'focus_area', 'good_for', 'no_of_days', 'type', 'duration', 'level')->where('visible', 1)->with(array('equipments' => function($query) {
                $query->select('name');
            }))->paginate(10); 

            foreach($splits as $k => $sp) {
                // if($sp['no_of_days'] != $sp['configured_days']) {
                //     $splits->forget($k);
                // }

                $focus_area = explode(',', $sp['focus_area']);
                $good_for = explode(',', $sp['good_for']);
                $level = explode(',', $sp['level']);
                $sp['focus_area'] = $focus_area;
                $sp['good_for'] = $good_for;
                $sp['level'] = $level;
            }

            if($splits->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Splits not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'splits' => $splits], 200);
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
     * @group  Splits
     * 
     * @authenticated
     *
     * API for getting single split
     * 
     * @urlParam  id required The ID of the split.
     * @urlParam  duration required the duration of the split.
     * 
     * @response  {
     *  "success": true,
     *  "split": {
     *      "id": 1,
     *      "code": "FBB21",
     *      "title": "Full Body Blaster",
     *      "slug": "full-body-blaster",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/splits/images/1623067648.jpg",
     *      "focus_area": "Full Body",
     *      "duration": "10:30",
     *      "video_link": "https://docs.google.com/spreadsheets/d/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM/edit#gid=0",
     *      "level": "Advanced",
     *      "frequency": "45",
     *      "length": "5",
     *      "splits": "578",
     *      "description": "fadsfadfda",
     *      "instructions": "fvadfadfa",
     *      "tags": "exercise,health,nutrition",
     *      "visible": 1,
     *      "warm_ups": null,
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
     *  "message": "split Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getSingleSplit() {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $where = array(
                'id' => request('id'),
            );

            // $split = Splits::with(['equipments', 'workouts' => function($query) use($duration) {
            //     $query->wherePivot('duration', $duration);
            // }])->where('id', request('id'))->where('visible', 1)->get()->first(); 

            $split = Splits::with('equipments', 'workouts')->where('id', $where['id'])->where('visible', 1)->get()->first(); 

            if(empty($split)) {
                return response()->json(['success' =>  false, 'message' => 'Split not found.'], 404);
            }
                
            $focus_area = explode(',', $split['focus_area']);
            $good_for = explode(',', $split['good_for']);
            $tags = explode(',', $split['tags']);
            $level = explode(',', $split['level']);
            $split['focus_area'] = $focus_area;
            $split['good_for'] = $good_for;
            $split['tags'] = $tags;
            $split['level'] = $level;
            $split['tips'] = $split['instructions'];
            $split['implementation'] = $split['breath'];

            foreach($split['Workouts'] as $k => $wk) {
                $duration = explode(',', $wk['duration']);
                $focus_area = explode(',', $wk['focus_area']);
                $good_for = explode(',', $wk['good_for']);
                $tags = explode(',', $wk['tags']);
                $level = explode(',', $wk['level']);
                $instructions = strip_tags(preg_replace('/\s+/', '', $wk['instructions']));
                // $description = strip_tags(preg_replace('/\s+/', '', $wk['description']));
                $wk['duration'] = $duration;
                $wk['focus_area'] = $focus_area;
                $wk['good_for'] = $good_for;
                $wk['tags'] = $tags;
                $wk['level'] = $level;
                $wk['implementation'] = $instructions;
                // $wk['description'] = $description;
            }

            if(empty($split)) {
                return response()->json(['success' =>  false, 'message' => 'Split not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'split' => $split], 200);
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
     * @group  Splits
     * 
     * API for getting single split duration
     * 
     * @authenticated
     * 
     * @urlParam  id required The ID of the split.
     * 
     * @response  {
     *  "success": true,
     *  "workout": [5, 10]
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

    public function getSplitDuration(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $durations = Splits::where('id', request('id'))->get()->pluck('duration')->first();
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
     * @group  Splits
     * 
     * @authenticated
     *
     * API for getting single workout by split day
     * 
     * @urlParam  id required The ID of the split.
     * @urlParam  day required The day of the split.
     * 
     * @response  {
     *  "success": true,
     *  "workout": {
     *      "id": 1,
     *      "code": "FBB21",
     *      "title": "Full Body Blaster",
     *      "slug": "full-body-blaster",
     *      "duration": "10:30",
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
     *  "message": "split Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getSplitWorkoutByDay() {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $id = request('id');
            $where = array('day' => request('day'),'duration' => request('duration'));

            $split = Splits::find($id);

            if(empty($split)) {
                return response()->json(['success' =>  false, 'message' => "Split not found."], 404);
            }

            $workout = Splits::with(['workouts' => function ($query) use ($where) {
                $query->wherePivot('duration', $where['duration'])->whereRaw('? between starting_day and ending_day', [$where['day']]);
            }])->where('id', $id)->get()->first()->workouts->first(); 

            if(empty($workout)) {
                return response()->json(['success' => false, 'message' => 'No workout found on the current day.'], 404);
            }

            $splitExercises = $workout->exercises()->where('exercise_workout.duration', request('duration'))->get();

            $focus_area = explode(',', $workout['focus_area']);
            $good_for = explode(',', $workout['good_for']);
            $tags = explode(',', $workout['tags']);
            $level = explode(',', $workout['level']);
            // $instructions = strip_tags(preg_replace('/\s+/', '', $workout['instructions']));
            // $description = strip_tags(preg_replace('/\s+/', '', $workout['description']));
            $workout['focus_area'] = $focus_area;
            $workout['good_for'] = $good_for;
            $workout['tags'] = $tags;
            $workout['level'] = $level;
            $workout['duration'] = $split->duration;
            // $workout['instructions'] = $instructions;
            // $workout['description'] = $description;

            foreach($splitExercises as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $type = explode(',', $ex['type']);
                $tags = explode(',', $ex['tags']);
                $level = explode(',', $ex['level']);
                // $instructions = strip_tags(preg_replace('/\s+/', '', $ex['instructions']));
                // $description = strip_tags(preg_replace('/\s+/', '', $ex['description']));
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['type'] = $type;
                $ex['tags'] = $tags;
                $ex['level'] = $level;
                $ex['based_on'] = (!empty($ex->pivot->based_on)) ? $ex->pivot->based_on : $ex->based_on;
                $ex['duration'] = (!empty($ex->pivot->ex_duration)) ? $ex->pivot->ex_duration : $ex->duration;
                $ex['reps'] = (!empty($ex->pivot->ex_reps)) ? $ex->pivot->ex_reps : $ex->reps;
                $ex['sets'] = (!empty($ex->pivot->sets)) ? $ex->pivot->sets : 0;
                $ex['rest_duration'] = (!empty($ex->pivot->rest_duration)) ? $ex->pivot->rest_duration : 0;
                // $ex['instructions'] = $instructions;
                // $ex['description'] = $description;
            }

            foreach($workout['poststreches'] as $k => $ps) {
                $focus_area = explode(',', $ps['focus_area']);
                $specific_muscles = explode(',', $ps['specific_muscles']);
                $good_for = explode(',', $ps['good_for']);
                $type = explode(',', $ps['type']);
                $tags = explode(',', $ps['tags']);
                $level = explode(',', $ps['level']);
                // $instructions = strip_tags(preg_replace('/\s+/', '', $ps['instructions']));
                // $description = strip_tags(preg_replace('/\s+/', '', $ps['description']));
                $ps['focus_area'] = $focus_area;
                $ps['specific_muscles'] = $specific_muscles;
                $ps['good_for'] = $good_for;
                $ps['type'] = $type;
                $ps['tags'] = $tags;
                $ps['level'] = $level;
                // $ps['instructions'] = $instructions;
                // $ps['description'] = $description;
            }

            foreach($workout['warmups'] as $k => $wm) {
                $focus_area = explode(',', $wm['focus_area']);
                $specific_muscles = explode(',', $wm['specific_muscles']);
                $good_for = explode(',', $wm['good_for']);
                $type = explode(',', $wm['type']);
                $tags = explode(',', $wm['tags']);
                $level = explode(',', $wm['level']);
                // $instructions = strip_tags(preg_replace('/\s+/', '', $wm['instructions']));
                // $description = strip_tags(preg_replace('/\s+/', '', $wm['description']));
                $wm['focus_area'] = $focus_area;
                $wm['specific_muscles'] = $specific_muscles;
                $wm['good_for'] = $good_for;
                $wm['type'] = $type;
                $wm['tags'] = $tags;
                $wm['level'] = $level;
                // $wm['instructions'] = $instructions;
                // $wm['description'] = $description;
            }

            $workout['exercises'] = $splitExercises;

            return response()->json(['success' =>  true, 'rest_durations' => $workout->exercises->pluck('rest_duration'), 'workout' => $workout], 200);
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
     * API for getting Saved splits
     * 
     * @bodyParam  playlistId integer required The id of the playlist. Example: 1
     * 
     * @response  {
     *  "splits": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/splits/images/1623067648.jpg",
     *      "focus_area": "Full Body",
     *      "duration": "10:30",
     *      "level": "Advanced",
     *      "frequency": 45,
     *      "length": 5
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/playlist/saved/splits?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/playlist/saved/splits?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/playlist/saved/splits",
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
     *  "message": "splits Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function playlistSavedSplits(Request $request) {
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

            $savedSplits = $playlist->savedSplits()->paginate(10);

            foreach($savedSplits as $k => $sp) {
                $subscription = $user->splitSubscriptions()->where('split_id', $sp['id'])->where('status', "ACTIVE")->get()->first();

                if(!empty($subscription)) {
                    $subscriptionProgress = $user->splitSubscriptions()->where('id', $subscription->id)->get()->first()->userSplitProgress()->whereBetween("date", [$subscription->start_date, date('Y-m-d')])->get();
                
                    if($subscription->user_split_progress_count > 0 && $subscription->split['workouts_count'] > 0) {
                        $user_progress_percent = $subscription->user_split_progress_count * 100 / $subscription->split['no_of_days'];
                    } else {
                        $user_progress_percent = 0;
                    }
                } else {
                    $user_progress_percent = 0;
                }
                
                $focus_area = explode(',', $sp['focus_area']);
                $good_for = explode(',', $sp['good_for']);
                $tags = explode(',', $sp['tags']);
                $level = explode(',', $sp['level']);
                $sp['focus_area'] = $focus_area;
                $sp['good_for'] = $good_for;
                $sp['tags'] = $tags;
                $sp['level'] = $level;
                $sp['user_progress'] = $user_progress_percent;
            }

            if($savedSplits->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Splits not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'splits' => $savedSplits], 200);
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
     * @group  Splits
     * 
     * @authenticated
     *
     * API for getting Favourite splits
     * 
     * @response  {
     *  "splits": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/splits/images/1623067648.jpg",
     *      "focus_area": "Full Body",
     *      "duration": "10:30",
     *      "level": "Advanced",
     *      "frequency": 45,
     *      "length": 5
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/favourite/splits?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/favourite/splits?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/favourite/splits",
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
     *  "message": "Splits Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function userFavouriteSplits(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $favouriteSplits = $user->favouriteSplits()->groupBy('split_id')->paginate(10);
            $data = array();

            foreach($favouriteSplits as $k => $sp) {
                $subscription = $user->splitSubscriptions()->where('split_id', $sp['id'])->where('status', "ACTIVE")->get()->first();

                if(!empty($subscription)) {
                    $subscriptionProgress = $user->splitSubscriptions()->where('id', $subscription->id)->get()->first()->userSplitProgress()->whereBetween("date", [$subscription->start_date, date('Y-m-d')])->get();
                
                    if($subscription->user_split_progress_count > 0 && $subscription->split['workouts_count'] > 0) {
                        $user_progress_percent = $subscription->user_split_progress_count * 100 / $subscription->split['no_of_days'];
                    } else {
                        $user_progress_percent = 0;
                    }
                } else {
                    $user_progress_percent = 0;
                }

                $focus_area = explode(',', $sp['focus_area']);
                $good_for = explode(',', $sp['good_for']);
                $tags = explode(',', $sp['tags']);
                $level = explode(',', $sp['level']);
                $sp['focus_area'] = $focus_area;
                $sp['good_for'] = $good_for;
                $sp['tags'] = $tags;
                $sp['level'] = $level;
                $sp['user_progress'] = $user_progress_percent;
            }

            if($favouriteSplits->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Splits not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'splits' => $favouriteSplits], 200);
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
     * @group  Splits
     * 
     * @authenticated
     *
     * API for getting recent splits
     * 
     * @response  {
     *  "splits": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/splits/images/1623067648.jpg",
     *      "focus_area": "Full Body",
     *      "duration": "10:30",
     *      "level": "Advanced",
     *      "frequency": 45,
     *      "length": 5
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/recent/splits?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/recent/splits?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/recent/splits",
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
     *  "message": "Splits Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function userRecentSplits(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $recentSplits = $user->recentSplits()->groupBy('split_id')->paginate(10);
            $data = array();

            foreach($recentSplits as $k => $sp) {
                $subscription = $user->splitSubscriptions()->where('split_id', $sp['id'])->where('status', "ACTIVE")->get()->first();

                if(!empty($subscription)) {
                    $subscriptionProgress = $user->splitSubscriptions()->where('id', $subscription->id)->get()->first()->userSplitProgress()->whereBetween("date", [$subscription->start_date, date('Y-m-d')])->get();
                
                    if($subscription->user_split_progress_count > 0 && $subscription->split['workouts_count'] > 0) {
                        $user_progress_percent = $subscription->user_split_progress_count * 100 / $subscription->split['no_of_days'];
                    } else {
                        $user_progress_percent = 0;
                    }
                } else {
                    $user_progress_percent = 0;
                }

                $focus_area = explode(',', $sp['focus_area']);
                $good_for = explode(',', $sp['good_for']);
                $tags = explode(',', $sp['tags']);
                $level = explode(',', $sp['level']);
                $sp['focus_area'] = $focus_area;
                $sp['good_for'] = $good_for;
                $sp['tags'] = $tags;
                $sp['level'] = $level;
                $sp['user_progress'] = $user_progress_percent;
            }

            if($recentSplits->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Splits not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'splits' => $recentSplits], 200);
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
     * @group  User management
     *
     * APIs for user split subscription
     * 
     * @authenticated
     * 
     * @bodyParam  split_id integer The split id of the split. Example: 4
     * 
     * @response  {
     *  "success": true,
     *  "message": "User subscribed to the split successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to subscribe the user to the split."
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
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     *  
     */

    public function userSplitSubscribe(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'split_id' => ['required', 'numeric'], 
            ]);

            if ($validator->fails()) {
                return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
            }

            $check = UserSplitSubscription::where('user_id', $user->id)->where('split_id', request('split_id'))->where('status', "ACTIVE")->get()->count();
            
            if($check >= 1) {
                return response()->json(['success' =>  false, 'message' => 'User already subscribed to this split and is currently active.'], 404);
            }

            $split = Splits::findOrFail(request('split_id'));

            $subscribeData = array(
                'subscription_no' => $user->id.date('Ymd').request('split_id'),
                'split_id' => request('split_id'),
                'start_date' => date('Y-m-d'),
                'end_date' => date('Y-m-d', strtotime(date('Y-m-d'). ' + '.$split['no_of_days'].' days')),
                'total_days' => $split['no_of_days']
            );

            $res = $user->splitSubscriptions()->create($subscribeData);

            if($res) {
                // $subscribeDayData = array();

                // foreach(range(1, $split['no_of_days']) as $k => $day) {
                //     // $workout = SplitWorkout::where('split_id', request('split_id'))->whereRaw('? between starting_day and ending_day', [$day])->get()->first();

                //     // if(empty($workout)) {
                //     //     return response()->json(['success' =>  false, 'message' => 'Unable to subscribe the user to the split because split is not fully configured.'], 404);
                //     // }

                //     $sdd['progress_id'] = $res->id;
                //     //$sdd['workout_id'] = $workout->workout_id;
                //     $sdd['day'] = $day;
                //     $sdd['date'] = date('Y-m-d', strtotime(date('Y-m-d'). ' + '.$day.' days'));
                //     array_push($subscribeDayData, $sdd);
                // }

                // UserSplitProgress::insert($subscribeDayData);
                return response()->json(['success' =>  true, 'subscription_id' => $res->id, 'message' => 'User subscribed to the split successfully.'], 200);
            } else {
                return response()->json(['success' =>  false, 'message' => 'Unable to subscribe the user to the split.'], 404);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            \DB::rollback();
            return response()->json(['success' => false, 'message' => $e->getMessage()], 404);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            \DB::rollback();
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group User management
     * 
     * APIs for getting user split subscriptions
     * 
     * @authenticated
     * 
     * @response  {
     *  "subscriptions": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "subscription_no": 61003452,
     *      "user_id": 6,
     *      "split_id": 2,
     *      "start_date": "2021-07-27",
     *      "end_date": "2021-10-25",
     *      "total_days": 90,
     *      "status": "ACTIVE",
     *      "created_at": "2021-07-27 10:03:45",
     *      "updated_at": "2021-07-27 10:07:18",
     *      "user_progress_count": 1,
     *      "user_progress_percent": 100
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscriptions?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscriptions?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/split/subscriptions",
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
     *  "message": "Subscriptions Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getUserSplitSubscriptions(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $subscriptions = $user->splitSubscriptions()->paginate(10);

            foreach($subscriptions as $subscription) {
                if(!empty($subscription->split)) {
                    $focus_area = explode(',', $subscription->split['focus_area']);
                    $good_for = explode(',', $subscription->split['good_for']);
                    $tags = explode(',', $subscription->split['tags']);
                    $level = explode(',', $subscription->split['level']);
                    $instructions = strip_tags(preg_replace('/\s+/', '', $subscription->split['instructions']));
                    $description = strip_tags(preg_replace('/\s+/', '', $subscription->split['description']));
                    $subscription->split['focus_area'] = $focus_area;
                    $subscription->split['good_for'] = $good_for;
                    $subscription->split['tags'] = $tags;
                    $subscription->split['level'] = $level;
                    $subscription->split['instructions'] = $instructions;
                    $subscription->split['description'] = $description;
                    
                    if($subscription->user_split_progress_count > 0 && $subscription->split['workouts_count'] > 0) {
                        $user_progress = $subscription->user_split_progress_count * 100 / $subscription->split['no_of_days'];
                    } else {
                        $user_progress = 0;
                    }

                    $subscription->user_progress_percent = $user_progress;
                }
            }
            
            if($subscriptions->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Subscriptions not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'subscriptions' => $subscriptions], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 404);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     * 
     * API for getting user split subscription progress
     * 
     * @authenticated
     * 
     * @urlParam  subscriptionId required The id of the subscription.
     * 
     * @response  {
     *  "progress": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "subscription_id": 1,
     *      "workout_id": 3,
     *      "day": 1,
     *      "date": "2021-07-27",
     *      "created_at": "2021-07-28 11:27:26",
     *      "updated_at": "2021-07-28 11:27:26"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscription/progress?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/split/subscription/progress?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/split/subscription/progress",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 4,
     *    "total": 4
     *  },
     *  "success": true,
     *  "progressCount": 1,
     *  "progressPercent": 33.333333333333336
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
     *  "message": "Subscriptions Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getUserSplitSubscriptionProgress(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $subscriptionId = request('subscriptionId');
            $subscription = $user->splitSubscriptions()->where('id', $subscriptionId)->get()->first();
            $subscriptionProgress = $user->splitSubscriptions()->where('id', $subscriptionId)->get()->first()->userSplitProgress()->whereBetween("date", [$subscription->start_date, date('Y-m-d')])->get();
            
            if($subscription->user_split_progress_count > 0 && $subscription->split['workouts_count'] > 0) {
                $user_progress_percent = $subscription->user_split_progress_count * 100 / $subscription->split['no_of_days'];
            } else {
                $user_progress_percent = 0;
            }

            if($subscriptionProgress->isEmpty()) {
                return response()->json(['success' =>  true, 'subscription_id' => $subscriptionId, 'progressCount' => $subscription->user_split_progress_count, 'progressPercent' => $user_progress_percent, 'progress' => [['subscription_id' => $subscriptionId, 'day' => 0]]], 200);
            } else {
                return response()->json(['success' =>  true, 'subscription_id' => $subscriptionId, 'progressCount' => $subscription->user_split_progress_count, 'progressPercent' => $user_progress_percent, 'progress' => $subscriptionProgress], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 404);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     *
     * APIs for saving user split subscription progress
     * 
     * @bodyParam  subscription_id integer required The id of the subscription
     * @bodyParam  workout_id integer required The id of the workout.
     * @bodyParam  day integer required The day of the subscription.
     * 
     * @response  {
     *  "success": true,
     *  "message": "progress saved successfully."
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
     *  "message": "unable to save progress."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     *   
     */

    public function userSplitSubscriptionProgress(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'subscription_id' => ['required', 'numeric'], 
                'workout_id' => ['required', 'numeric'], 
                'day' => ['required', 'numeric'], 
            ]);

            if ($validator->fails()) {
                return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
            }

            $check = UserSplitProgress::where('progress_id', request('subscription_id'))->where('workout_id', request('workout_id'))->where('day', request('day'))->where('status', 'TRUE')->get()->count();
            
            if($check >= 1) {
                return response()->json(['success' =>  false, 'message' => 'User progress already saved.'], 404);
            }

            $progressData = array('progress_id' => request('subscription_id'), 'workout_id' => request('workout_id'), 'day' => request('day'), 'date' => date('Y-m-d'), 'status' => 'TRUE');
            $res = UserSplitProgress::insert($progressData);

            if($res) {
                return response()->json(['success' =>  true, 'message' => 'progress saved successfully.'], 200);
            } else {
                return response()->json(['success' =>  false, 'message' => 'unable to save progress.'], 404);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 404);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     * 
     * API for resetting user split subscription progress
     * 
     * @authenticated
     * 
     * @urlParam  subscriptionId required The id of the subscription.
     * 
     * @response  200 {
     *  "success": true,
     *  "message": "Subscription progress reset successfully."
     * }  
     * 
     * @response  403 {
     *  "success": false,
     *  "message": "Token is Expired."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Subscriptions Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function resetUserSplitSubscriptionProgress(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $subscriptionId = request('subscriptionId');
            $subscription = $user->splitSubscriptions()->where('id', $subscriptionId)->get();

            if($subscription->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Subscriptions not found.'], 404);
            }

            $subscriptionProgress = $user->splitSubscriptions()->where('id', $subscriptionId)->get()->first()->userSplitProgress()->delete();
            return response()->json(['success' => true, 'message' => 'Subscription progress reset successfully.'], 200);
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 404);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
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