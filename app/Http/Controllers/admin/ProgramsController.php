<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\ProgramsImport;
use App\Imports\ProgramWorkoutImport;
use App\Settings;
use App\User;
use App\Programs;
use App\Workouts;
use App\FocusArea;
use App\GoodFor;
use App\Muscles;
use App\ProgramWorkout;
use App\UserSubscription;
use App\UserProgress;
use App\UserPlaylist;
use App\UserRecent;
use App\UserFavourite;
use App\PlaylistSaved;
use JWTAuth;
use File;
use DB;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class ProgramsController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $programs = Programs::where('visible', 1)->get();
        $focusAreas = FocusArea::where("program", 1)->get();
        $goodFors = GoodFor::all();
        $muscles = Muscles::all();
        $pageTitle = 'Programs';
        return view('admin.programs', compact('setting', 'programs', 'pageTitle', 'focusAreas', 'goodFors', 'muscles'));
    }

    public function store_program(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'duration' => ['required', 'array', 'min:1'],
            'instruction' => ['required', 'string'],
            'breath' => ['required', 'string'],
            'good_for' => ['required', 'array', 'min:1'],
            'focus_area' => ['required', 'array', 'min:1'],
            'level' => ['required', 'array', 'min:1'],
            // 'video_link' => ['required', 'string', 'url'],
            'image' => ['image', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
            'equipments' => ['required', 'array', 'min:1'],
            'no_of_days' => ['required', 'numeric']
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Program") {
            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefile->move('uploads/programs/images/', $imagefilename);
            } else {
                $imagefilename = url('uploads/default-placeholder.png');
            }

            $pCount = Programs::get()->count();
            
            if($pCount > 0) {
                $last = Programs::latest('id')->first()->id;
                $code = "POZPM".($last + 1);
            } else {
                $code = "POZPM1";
            }

            $programData = array('title' => request('title'), 'code' => $code, 'duration' => implode(',', request('duration')), 'slug' => Str::slug(request('title')), 'instructions' => request('instruction'), 'image' => $imagefilename, 'breath' => request('breath'), 'focus_area' => implode(',', request('focus_area')), 'good_for' => implode(',', request('good_for')), 'level' => implode(',',request('level')), 'tags' => request('tags'), 'no_of_days' => request('no_of_days'), 'visible' => request('visible'), 'category_id' => request('category'));

            $program = Programs::create($programData);

            if($program) {
                $program->equipments()->attach(request('equipments'));
                return response()->json(['success'=>'Program Posted Successfully.']);
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
                $image->move('uploads/programs/images/', $new_image);
            }

            $programData = array('title' => request('title'), 'duration' => implode(',', request('duration')), 'slug' => Str::slug(request('title')), 'instructions' => request('instruction'), 'image' => $new_image, 'breath' => request('breath'), 'focus_area' => implode(',', request('focus_area')), 'good_for' => implode(',', request('good_for')), 'level' => implode(',',request('level')), 'tags' => request('tags'), 'video_link' => request('video_link'), 'no_of_days' => request('no_of_days'), 'visible' => request('visible'), 'category_id' => request('category'));

            $res1 = Programs::where('id', $id)->update($programData);

            if($res1) {
                $program = Programs::find($id);
                $program->equipments()->sync(request('equipments'));
                return response()->json(['success' => 'Program Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function importPrograms(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Please upload a valid CSV file..!');
        }

        Excel::import(new ProgramsImport, request()->file('file'));
        return redirect()->back();
    }

    public function edit_program(Request $request) {
        $pid = request('pid');
        $program = Programs::with('equipments', 'workouts')->where('id', $pid)->get()->first();
        return \Response::json($program);
    }

    public function deleteProgram(Request $request) {
        $ids = explode(",", request('id'));
        DB::beginTransaction();

        try {
            foreach($ids as $id) {
                $program = Programs::find($id);
                $res = Programs::where('id', $id)->delete();
                ProgramWorkout::where('program_id', $id)->delete();
                UserRecent::where('program_id', $id)->delete();
                UserFavourite::where('program_id', $id)->delete();
                PlaylistSaved::where('program_id', $id)->delete();
                $destinationPath = public_path("uploads/programs/images/".$program['image']);
                File::delete($destinationPath);
            }

            DB::commit();
            return redirect()->back()->with('success', 'Programs Deleted Successfully.');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', 'Error Deleting Programs.');
        }
    }

    public function workouts(Request $request) {
        $prid = (int)request('prid');
        $duration = (int)request('duration');
        $program = Programs::find($prid);
        $setting = Settings::all()->first();
        $programWorkouts = $program->workouts->where('pivot.duration', $duration);
        $programWorkoutsDays = $program->workouts->where('pivot.duration', $duration)->sum('pivot.total_days');
        $lastProgramWorkout = $program->workouts->where('pivot.duration', $duration)->last();
        $workouts = Workouts::whereRaw("find_in_set('".$duration."', duration)")->get();
        $pageTitle = $program->title.' '.$program->no_of_days.' days Details (Duration - '.$duration.' Mins)';
        return view('admin.programWorkouts', compact('program', 'duration', 'programWorkouts', 'programWorkoutsDays', 'lastProgramWorkout', 'workouts', 'pageTitle', 'setting'));
    }

    public function editProgramWorkout(Request $request) {
        $pwId = request('pwId');
        $programWorkout = ProgramWorkout::with('workout')->where('id', $pwId)->get()->first();
        return \Response::json($programWorkout);
    }

    public function deleteProgramWorkout(Request $request) {
        $ids = explode(",", request('id'));

        foreach($ids as $id) {
            $res = ProgramWorkout::where('id', $id)->delete();
        }

        return redirect()->route('admin-program-workouts-variation', [request('prid'), request('duration')])->with('success', 'Program Workout Deleted Successfully...');
    }

    public function storeWorkout(Request $request) {
        if(request('save') == "Post Variation") {
            $validator = Validator::make($request->all(), [
                'pmid' => ['required', 'numeric'],
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

            $pw = ProgramWorkout::where('program_id', request('pmid'))->where('duration', request('duration'))->whereRaw("((starting_day = ".request('start')." or starting_day = ".request('end').") or (ending_day = ".request('start')." or ending_day = ".request('end')."))")->get()->count();

            if($pw > 0) {
                return response()->json(['error'=> 'Selected day already full.']);
            }

            $total_workout_days = (request('end') - request('start')) + 1;
            $program = Programs::find(request('pmid'));
            $programWorkoutDays = ProgramWorkout::where('program_id', request('pmid'))->where('duration', request('duration'))->sum('total_days');

            if($program->no_of_days < ($programWorkoutDays + $total_workout_days)) {
                return response()->json(['error' => 'workout days becomes greater than program set number of days.']);
            }

            $programWorkoutData = array('program_id' => request('pmid'), 'workout_id' => request('wkid'), 'duration' => request('duration'), 'starting_day' => request('start'), 'ending_day' => request('end'), 'total_days' => $total_workout_days);

            if(ProgramWorkout::create($programWorkoutData)) {
                $upd_workout_days = $programWorkoutDays + $total_workout_days;
                Programs::where('id', request('pmid'))->update(array('configured_days' => $upd_workout_days));
                return response()->json(['success'=>'Workout Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $validator = Validator::make($request->all(), [
                'pmid' => ['required', 'numeric'],
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
            $program = Programs::find(request('pmid'));
            $programWorkoutDays = ProgramWorkout::where('program_id', request('pmid'))->where('duration', request('duration'))->sum('total_days');

            if($program->no_of_days < ($programWorkoutDays + $total_workout_days)) {
                return response()->json(['error' => 'workout days becomes greater than program set number of days.']);
            }

            $programWorkoutData = array('program_id' => request('pmid'), 'starting_day' => request('start'), 'ending_day' => request('end'), 'total_days' => $total_workout_days);

            if(ProgramWorkout::where('id', $id)->update($programWorkoutData)) {
                return response()->json(['success'=>'Workout Updated Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        }
    }

    public function importWorkout(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
            'pmid' => ['required', 'numeric'],
            'duration' => ['required', 'integer'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Please upload a valid CSV file..!');
        }

        $import = Excel::import(new ProgramWorkoutImport, request()->file('file'));

        if($import) {
            return redirect()->back()->with('success', 'Workouts Imported Successfully..!');
        }

        return redirect()->back()->with('error', 'Error in Importing..!');
    }

    /**
     * @group  Program
     * 
     * @authenticated
     *
     * API for getting All programs
     * 
     * @response  {
     *  "programs": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "good_for": "vdzvz",
     *      "no_of_days": 90,
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/programs/images/1623067648.jpg",
     *      "focus_area": "Full Body",
     *      "duration": "10:30",
     *      "level": "Advanced",
     *      "frequency": 45
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/programs/all?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/programs/all?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/programs/all",
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
     *  "message": "programs Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getAllPrograms() {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $programs = Programs::select('id', 'title', 'image', 'good_for', 'no_of_days', 'configured_days', 'focus_area', 'duration', 'level')->with(array('equipments' => function($query) {
                $query->select('name');
            }))->where('visible', 1)->paginate(10); 

            $selected = [];
            foreach($programs as $k => $pm) {
                // if($pm['no_of_days'] != $pm['configured_days']) {
                //     $programs[] = $programs->pull($k);
                // }

                $focus_area = explode(',', $pm['focus_area']);
                $good_for = explode(',', $pm['good_for']);
                $level = explode(',', $pm['level']);
                $pm['focus_area'] = $focus_area;
                $pm['good_for'] = $good_for;
                $pm['level'] = $level;
            }

            if($programs->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Programs not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'programs' => $programs], 200);
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
     * @group  Program
     * 
     * @authenticated
     *
     * API for getting single program
     * 
     * @urlParam  id required The ID of the program.
     * @urlParam  duration required the duration of the program.
     * 
     * @response  {
     *  "success": true,
     *  "programs": {
     *      "id": 1,
     *      "code": "FBB21",
     *      "title": "Full Body Blaster",
     *      "slug": "full-body-blaster",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/programs/images/1623067648.jpg",
     *      "focus_area": "Full Body",
     *      "duration": "10:30",
     *      "video_link": "https://docs.google.com/spreadsheets/d/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM/edit#gid=0",
     *      "level": "Advanced",
     *      "frequency": "45",
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
     *  "message": "programs Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getSingleProgram() {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $where = array(
                'id' => request('id'),
            );
            
            // $program = Programs::with(['equipments', 'workouts' => function($q) use($where) {
            //     $q->wherePivot('duration', $where['duration']);
            // }])->where('id', $where['id'])->where('visible', 1)->get()->first(); 

            $program = Programs::with('equipments', 'workouts')->where('id', $where['id'])->where('visible', 1)->get()->first(); 

            if(empty($program)) {
                return response()->json(['success' =>  false, 'message' => 'Program not found.'], 404);
            }
            
            $focus_area = explode(',', $program['focus_area']);
            $good_for = explode(',', $program['good_for']);
            $tags = explode(',', $program['tags']);
            $level = explode(',', $program['level']);
            $program['focus_area'] = $focus_area;
            $program['good_for'] = $good_for;
            $program['tags'] = $tags;
            $program['level'] = $level;
            $program['tips'] = $program['instructions'];
            $program['implementation'] = $program['breath'];

            foreach($program['workouts'] as $k => $wk) {

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

            if(empty($program)) {
                return response()->json(['success' =>  false, 'message' => 'Program not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'program' => $program], 200);
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
     * @group  Program
     * 
     * API for getting single program duration
     * 
     * @authenticated
     * 
     * @urlParam  id required The ID of the program.
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

    public function getProgramDuration(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $durations = Programs::where('id', request('id'))->get()->pluck('duration')->first();
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
     * @group  Program
     * 
     * @authenticated
     *
     * API for getting single workout by program day
     * 
     * @urlParam  id required The ID of the program.
     * @urlParam  day required The day of the program.
     * @urlParam  duration required The duration of the program.
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
     *  "message": "programs Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getProgramWorkoutByDay() {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $id = request('id');
            $where = array('day' => request('day'), 'duration' => request('duration'));

            $program = Programs::find($id);

            if(empty($program)) {
                return response()->json(['success' =>  false, 'message' => "Program not found."], 404);
            }
            
            $workout = Programs::with(['workouts' => function ($query) use ($where) {
                $query->wherePivot('duration', $where['duration'])->whereRaw('? between starting_day and ending_day', [$where['day']]);
            }])->where('id', $id)->get()->first()->workouts->first(); 
            
            if(empty($workout)) {
                return response()->json(['success' => false, 'message' => 'No workout found on the current day.'], 404);
            }

            $workoutExercises = $workout->exercises()->where('exercise_workout.duration', request('duration'))->get();

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
            $workout['duration'] = $program->duration;
            // $workout['instructions'] = $instructions;
            // $workout['description'] = $description;

            foreach($workoutExercises as $k => $ex) {
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

            $workout['exercises'] = $workoutExercises;

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
     * API for getting Saved programs
     * 
     * @bodyParam  playlistId integer required The id of the playlist. Example: 1
     * 
     * @response  {
     *  "programs": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "good_for": "vdzvz",
     *      "no_of_days": 90,
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/programs/images/1623067648.jpg",
     *      "focus_area": "Full Body",
     *      "duration": "10:30",
     *      "level": "Advanced",
     *      "frequency": 45
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/playlist/saved/programs?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/playlist/saved/programs?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/playlist/saved/programs",
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
     *  "message": "programs Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function playlistSavedPrograms(Request $request) {
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
            
            $savedPrograms = $playlist->savedPrograms()->paginate(10);

            foreach($savedPrograms as $k => $pm) {
                $subscription = $user->subscriptions()->where('program_id', $pm['id'])->where('status', "ACTIVE")->get()->first();

                if(!empty($subscription)) {
                    $subscriptionProgress = $user->subscriptions()->where('id', $subscription->id)->get()->first()->userProgress()->whereBetween("date", [$subscription->start_date, date('Y-m-d')])->get();
                
                    if($subscription->user_progress_count > 0 && $subscription->program['workouts_count'] > 0) {
                        $user_progress_percent = $subscription->user_progress_count * 100 / $subscription->program['no_of_days'];
                    } else {
                        $user_progress_percent = 0;
                    }
                } else {
                    $user_progress_percent = 0;
                }

                $focus_area = explode(',', $pm['focus_area']);
                $good_for = explode(',', $pm['good_for']);
                $tags = explode(',', $pm['tags']);
                $level = explode(',', $pm['level']);
                $pm['focus_area'] = $focus_area;
                $pm['good_for'] = $good_for;
                $pm['tags'] = $tags;
                $pm['level'] = $level;
                $pm['user_progress'] = $user_progress_percent;
            }

            if($savedPrograms->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Programs not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'programs' => $savedPrograms], 200);
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
     * @group  Program
     * 
     * @authenticated
     *
     * API for getting Favourite programs
     * 
     * @response  {
     *  "programs": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "good_for": "vdzvz",
     *      "no_of_days": 90,
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/programs/images/1623067648.jpg",
     *      "focus_area": "Full Body",
     *      "duration": "10:30",
     *      "level": "Advanced",
     *      "frequency": 45
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/favourite/programs?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/favourite/programs?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/favourite/programs",
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
     *  "message": "programs Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function userFavouritePrograms(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $favouritePrograms = $user->favouritePrograms()->paginate(10);
            $data = array();

            foreach($favouritePrograms as $k => $pm) {
                $subscription = $user->subscriptions()->where('program_id', $pm['id'])->where('status', "ACTIVE")->get()->first();

                if(!empty($subscription)) {
                    $subscriptionProgress = $user->subscriptions()->where('id', $subscription->id)->get()->first()->userProgress()->whereBetween("date", [$subscription->start_date, date('Y-m-d')])->get();
                
                    if($subscription->user_progress_count > 0 && $subscription->program['workouts_count'] > 0) {
                        $user_progress_percent = $subscription->user_progress_count * 100 / $subscription->program['no_of_days'];
                    } else {
                        $user_progress_percent = 0;
                    }
                } else {
                    $user_progress_percent = 0;
                }

                $focus_area = explode(',', $pm['focus_area']);
                $good_for = explode(',', $pm['good_for']);
                $tags = explode(',', $pm['tags']);
                $level = explode(',', $pm['level']);
                $pm['focus_area'] = $focus_area;
                $pm['good_for'] = $good_for;
                $pm['tags'] = $tags;
                $pm['level'] = $level;
                $pm['user_progress'] = $user_progress_percent;
            }

            if($favouritePrograms->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Programs not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'programs' => $favouritePrograms], 200);
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
     * @group  Program
     * 
     * API for getting recent programs
     * 
     * @authenticated
     * 
     * @response  {
     *  "programs": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "good_for": "vdzvz",
     *      "no_of_days": 90,
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/programs/images/1623067648.jpg",
     *      "focus_area": "Full Body",
     *      "duration": "10:30",
     *      "level": "Advanced",
     *      "frequency": 45
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/recent/programs?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/recent/programs?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/recent/programs",
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
     *  "message": "programs Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function userRecentPrograms(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $recentPrograms = $user->recentPrograms()->paginate(10);
            $data = array();

            foreach($recentPrograms as $k => $pm) {
                $subscription = $user->subscriptions()->where('program_id', $pm['id'])->where('status', "ACTIVE")->get()->first();

                if(!empty($subscription)) {
                    $subscriptionProgress = $user->subscriptions()->where('id', $subscription->id)->get()->first()->userProgress()->whereBetween("date", [$subscription->start_date, date('Y-m-d')])->get();
                
                    if($subscription->user_progress_count > 0 && $subscription->program['workouts_count'] > 0) {
                        $user_progress_percent = $subscription->user_progress_count * 100 / $subscription->program['no_of_days'];
                    } else {
                        $user_progress_percent = 0;
                    }
                } else {
                    $user_progress_percent = 0;
                }
                
                $focus_area = explode(',', $pm['focus_area']);
                $good_for = explode(',', $pm['good_for']);
                $tags = explode(',', $pm['tags']);
                $level = explode(',', $pm['level']);
                $pm['focus_area'] = $focus_area;
                $pm['good_for'] = $good_for;
                $pm['tags'] = $tags;
                $pm['level'] = $level;
                $pm['user_progress'] = $user_progress_percent;
            }

            if($recentPrograms->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Programs not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'programs' => $recentPrograms], 200);
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
     * APIs for user program subscription
     * 
     * @authenticated
     * 
     * @bodyParam  program_id integer The program id of the program. Example: 4
     * 
     * @response  {
     *  "success": true,
     *  "message": "User subscribed to the program successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to subscribe the user to the program."
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

    public function userProgramSubscribe(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'program_id' => ['required', 'numeric'], 
            ]);

            if ($validator->fails()) {
                return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
            }

            $check = UserSubscription::where('user_id', $user->id)->where('program_id', request('program_id'))->where('status', "ACTIVE")->get()->count();
            
            if($check >= 1) {
                return response()->json(['success' =>  false, 'message' => 'User already subscribed to this program and is currently active.'], 404);
            }

            $program = Programs::findOrFail(request('program_id'));

            $subscribeData = array(
                'subscription_no' => $user->id.date('Ymd').request('program_id'),
                'program_id' => request('program_id'),
                'start_date' => date('Y-m-d'),
                'end_date' => date('Y-m-d', strtotime(date('Y-m-d'). ' + '.$program['no_of_days'].' days')),
                'total_days' => $program['no_of_days']
            );

            $res = $user->subscriptions()->create($subscribeData);

            if($res) {
                // $subscribeDayData = array();
                // foreach(range(1, $program['no_of_days']) as $k => $day) {
                //     // $workout = ProgramWorkout::where('program_id', request('program_id'))->whereRaw('? between starting_day and ending_day', [4])->get()->first();

                //     // if(empty($workout)) {
                //     //     return response()->json(['success' =>  false, 'message' => 'Unable to subscribe the user to the program because program is not fully configured.'], 404);
                //     // }

                //     $sdd['subscription_id'] = $res->id;
                //     //$sdd['workout_id'] = $workout->workout_id;
                //     //$sdd['day'] = $day;
                //     //$sdd['date'] = date('Y-m-d', strtotime(date('Y-m-d'). ' + '.$day.' days'));
                //     array_push($subscribeDayData, $sdd);
                // }

                // UserProgress::insert($subscribeDayData);
                return response()->json(['success' =>  true, 'subscription_id' => $res->id, 'message' => 'User subscribed to the program successfully.'], 200);
            } else {
                return response()->json(['success' =>  false, 'message' => 'Unable to subscribe the user to the program.'], 404);
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
     * APIs for getting user program subscriptions
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
     *      "program_id": 2,
     *      "start_date": "2021-07-27",
     *      "end_date": "2021-10-25",
     *      "total_days": 90,
     *      "status": "ACTIVE",
     *      "created_at": "2021-07-27 10:03:45",
     *      "updated_at": "2021-07-27 10:07:18",
     *      "user_progress_count": 1,
     *      "user_progress_percent": 100
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscriptions?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscriptions?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/program/subscriptions",
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

    public function getUserProgramSubscriptions(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $subscriptions = $user->subscriptions()->paginate(10);

            foreach($subscriptions as $subscription) {
                if(!empty($subscription->program)) {
                    $focus_area = explode(',', $subscription->program['focus_area']);
                    $good_for = explode(',', $subscription->program['good_for']);
                    $tags = explode(',', $subscription->program['tags']);
                    $level = explode(',', $subscription->program['level']);
                    $instructions = strip_tags(preg_replace('/\s+/', '', $subscription->program['instructions']));
                    $description = strip_tags(preg_replace('/\s+/', '', $subscription->program['description']));
                    $subscription->program['focus_area'] = $focus_area;
                    $subscription->program['good_for'] = $good_for;
                    $subscription->program['tags'] = $tags;
                    $subscription->program['level'] = $level;
                    $subscription->program['instructions'] = $instructions;
                    $subscription->program['description'] = $description;
                    
                    if($subscription->user_progress_count > 0 && $subscription->program['workouts_count'] > 0) {
                        $user_progress = $subscription->user_progress_count * 100 / $subscription->program['no_of_days'];
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
     * API for getting user program subscription progress
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
     *      "subscription_no": 71202109031,
     *      "workout_id": 3,
     *      "day": 1,
     *      "date": "2021-07-27",
     *      "created_at": "2021-07-28 11:27:26",
     *      "updated_at": "2021-07-28 11:27:26"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscription/progress?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/program/subscription/progress?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/user/program/subscription/progress",
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

    public function getUserProgramSubscriptionProgress(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $subscriptionId = request('subscriptionId');
            $subscription = $user->subscriptions()->where('id', $subscriptionId)->get()->first();
            $subscriptionProgress = $user->subscriptions()->where('id', $subscriptionId)->get()->first()->userProgress()->whereBetween("date", [$subscription->start_date, date('Y-m-d')])->get();
            
            if($subscription->user_progress_count > 0 && $subscription->program['workouts_count'] > 0) {
                $user_progress_percent = $subscription->user_progress_count * 100 / $subscription->program['no_of_days'];
            } else {
                $user_progress_percent = 0;
            }
            
            if($subscriptionProgress->isEmpty()) {
                return response()->json(['success' =>  true, 'subscription_id' => $subscriptionId, 'progressCount' => $subscription->user_progress_count, 'progressPercent' => $user_progress_percent, 'progress' => [['subscription_id' => $subscriptionId, 'day' => 0]]], 200);
            } else {
                return response()->json(['success' =>  true, 'subscription_id' => $subscriptionId, 'progressCount' => $subscription->user_progress_count, 'progressPercent' => $user_progress_percent, 'progress' => $subscriptionProgress], 200);
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
     * APIs for saving user program subscription progress
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

    public function userProgramSubscriptionProgress(Request $request) {
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

            $check = UserProgress::where('subscription_id', request('subscription_id'))->where('workout_id', request('workout_id'))->where('day', request('day'))->where('status', 'TRUE')->get()->count();
            
            if($check >= 1) {
                return response()->json(['success' =>  false, 'message' => 'User progress already saved.'], 404);
            }

            $progressData = array('subscription_id' => request('subscription_id'), 'workout_id' => request('workout_id'), 'day' => request('day'), 'date' => date('Y-m-d'), 'status' => 'TRUE');
            $res = UserProgress::insert($progressData);

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
     * API for resetting user program subscription progress
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

    public function resetUserProgramSubscriptionProgress(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $subscriptionId = request('subscriptionId');
            $subscription = $user->subscriptions()->where('id', $subscriptionId)->get();

            if($subscription->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Subscriptions not found.'], 404);
            }

            $subscriptionProgressDelete = $user->subscriptions()->where('id', $subscriptionId)->get()->first()->userProgress()->delete();
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