<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\FocusArea;
use App\GoodFor;
use App\Muscles;
use App\Duration;
use App\Settings;
use App\Category;
use App\Exercises;
use App\Workouts;
use App\Equipments;
use App\Programs;
use App\Strech;
use App\Splits;
use Auth;
use JWTAuth;
use File;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class FilterController extends Controller
{
    public function index() {
        $focusAreas = FocusArea::orderBy('id', 'DESC')->get();
        $setting = Settings::all()->first();
        $pageTitle = 'Focus Areas';
        return view('admin.focusArea', compact('pageTitle', 'setting', 'focusAreas'));
    }

    public function storeFocusArea(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:60'],
            'exercise' => ['required', 'numeric'],
            'workout' => ['required', 'numeric'],
            'program' => ['required', 'numeric'],
            'split' => ['required', 'numeric'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Focus Area") {
            $focusArea = array('name' => request('name'), 'slug' => str_slug(request('name')), 'exercise' => request('exercise'), 'workout' => request('workout'), 'program' => request('program'), 'split' => request('split'));

            if(FocusArea::create($focusArea)) {
                return response()->json(['success'=>'Focus Area Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            $focusArea = array('name' => request('name'), 'slug' => str_slug(request('name')), 'exercise' => request('exercise'), 'workout' => request('workout'), 'program' => request('program'), 'split' => request('split'));
            $res1 = FocusArea::where('id', $id)->update($focusArea);

            if($res1) {
                return response()->json(['success' => 'Focus Area Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function editFocusArea(Request $request) {
        $faId = request('faId');
        $focusArea = FocusArea::where('id', $faId)->get()->first();
        return \Response::json($focusArea);
    }

    public function deleteFocusArea(Request $request) {
        $id = request('id');
        $res = FocusArea::where('id', $id)->delete();
        //dd($res);
        if($res) 
            return redirect()->back()->with('success', 'Focus Area Deleted Successfully...');
        else 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
    }

    public function showGoodFor() {
        $goodFors = GoodFor::orderBy('id', 'DESC')->get();
        $setting = Settings::all()->first();
        $pageTitle = 'Good Fors';
        return view('admin.goodFor', compact('pageTitle', 'setting', 'goodFors'));
    }

    public function storeGoodFor(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:60'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Good For") {
            $goodFor = array('name' => request('name'), 'slug' => str_slug(request('name')));

            if(GoodFor::create($goodFor)) {
                return response()->json(['success'=>'Good For Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            $goodFor = array('name' => request('name'), 'slug' => str_slug(request('name')));
            $res1 = GoodFor::where('id', $id)->update($goodFor);

            if($res1) {
                return response()->json(['success' => 'Good For Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function editGoodFor(Request $request) {
        $gfId = request('gfId');
        $goodFor = GoodFor::where('id', $gfId)->get()->first();
        return \Response::json($goodFor);
    }

    public function deleteGoodFor(Request $request) {
        $id = request('id');
        $res = GoodFor::where('id', $id)->delete();
        //dd($res);
        if($res) 
            return redirect()->back()->with('success', 'Good For Deleted Successfully...');
        else 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
    }

    public function showMuscles() {
        $muscles = Muscles::orderBy('id', 'DESC')->get();
        $setting = Settings::all()->first();
        $pageTitle = 'Muscles';
        return view('admin.muscles', compact('pageTitle', 'setting', 'muscles'));
    }

    public function storeMuscles(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:60'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Muscle") {
            $muscles = array('name' => request('name'), 'slug' => str_slug(request('name')));

            if(Muscles::create($muscles)) {
                return response()->json(['success'=>'Muscle Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            $muscles = array('name' => request('name'), 'slug' => str_slug(request('name')));
            $res1 = Muscles::where('id', $id)->update($muscles);

            if($res1) {
                return response()->json(['success' => 'Muscle Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function editMuscles(Request $request) {
        $mId = request('mId');
        $muscle = Muscles::where('id', $mId)->get()->first();
        return \Response::json($muscle);
    }

    public function deleteMuscles(Request $request) {
        $id = request('id');
        $res = Muscles::where('id', $id)->delete();
        //dd($res);
        if($res) 
            return redirect()->back()->with('success', 'Muscle Deleted Successfully...');
        else 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
    }

    public function showDurations() {
        $durations = Duration::orderBy('id', 'DESC')->get();
        $setting = Settings::all()->first();
        $pageTitle = 'Durations';
        return view('admin.durations', compact('pageTitle', 'setting', 'durations'));
    }

    public function storeDurations(Request $request) {
        $validator = Validator::make($request->all(), [
            'duration' => ['required', 'numeric'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Duration") {
            $duration = array('duration' => request('duration'));

            if(Duration::create($duration)) {
                return response()->json(['success'=>'Duration Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            $duration = array('duration' => request('duration'));
            $res1 = Duration::where('id', $id)->update($duration);

            if($res1) {
                return response()->json(['success' => 'Muscle Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function editDurations(Request $request) {
        $dId = request('dId');
        $duration = Duration::where('id', $dId)->get()->first();
        return \Response::json($duration);
    }

    public function deleteDurations(Request $request) {
        $id = request('id');
        $res = Duration::where('id', $id)->delete();
        //dd($res);
        if($res) 
            return redirect()->back()->with('success', 'Duration Deleted Successfully...');
        else 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
    }

    /**
     * @group  Filters
     * 
     * API for Filtering All exercises 
     * 
     * @authenticated
     * 
     * @bodyParam  title string The title of the exercise.
     * @bodyParam  duration array The duration min limit of the exercise.
     * @bodyParam  focus_area array The focus area of the exercise.
     * @bodyParam  specific_muscles array The specific muscles of the exercise.
     * @bodyParam  good_for array The good for of the exercise.
     * @bodyParam  type array The type of the exercise.
     * @bodyParam  level array The level of the exercise.
     * @bodyParam  equipment array The equipments of the exercise.
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
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/exercise?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/exercise?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/exercise",
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

    public function exerciseFilter(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $title = request('title');
            $level = request('level');
            $duration = request('duration');
            $focus_area = request('focus_area');
            $specific_muscles = request('specific_muscles');
            $good_for = request('good_for');
            $type = request('type');
            $equipment = request('equipment');

            $exercises = Exercises::query()->select('id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image');

            if(isset($title)) {
                $exercises = $exercises->orWhere('title', 'LIKE', "%".$title."%")->orWhereRaw("find_in_set('".$title."',tags)");
            }
            
            if(isset($level)) {
                foreach($level as $lv) {
                    $exercises = $exercises->whereRaw("find_in_set('".$lv."',level)");
                }
            }

            // if(isset($duration)) {
            //     $exercises = $exercises->orWhereBetween('duration', [$duration[0], $duration[1]]);
            // }

            // if(isset($duration)) {
            //     $exercises = $exercises->where('duration', $duration);
            // }

            if(isset($focus_area)) {
                foreach($focus_area as $fa) {
                    $exercises = $exercises->whereRaw("find_in_set('".$fa."',focus_area)");
                }
            }

            // if(isset($specific_muscles)) {
            //     foreach($specific_muscles as $sm) {
            //         $exercises = $exercises->whereRaw("find_in_set('".$sm."',specific_muscles)");
            //     }
            // }

            // if(isset($good_for)) {
            //     foreach($good_for as $gf) {
            //         $exercises = $exercises->whereRaw("find_in_set('".$gf."',good_for)");
            //     }
            // }

            // if(isset($type)) {
            //     foreach($type as $ty) {
            //         $exercises = $exercises->whereRaw("find_in_set('".$ty."',type)");
            //     }
            // }

            // if(isset($equipment)) {
            //     foreach($equipment as $eq) {
            //         $exercises = $exercises->whereHas('equipments', function($q) use ($eq) {
            //             $q->where('equipment_id', $eq);
            //         });
            //     }
            // }
            
            $exercises = $exercises->with(array('equipments' => function($query) {
                $query->select('name');
            }))->orderBy('id', 'ASC')->paginate(10);

            foreach($exercises as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $level = explode(',', $ex['level']);
                $type = explode(',', $ex['type']);
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['level'] = $level;
                $ex['type'] = $type;
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
     * @group  Filters
     * 
     * API for getting All exercise filters
     * 
     * @authenticated
     * 
     * @response  {
     *   "filters": {
     *       "Level": [
     *           {
     *               "id": "Beginner",
     *               "name": "Beginner"
     *           },
     *           {
     *               "id": "Intermediate",
     *               "name": "Intermediate"
     *           },
     *           {
     *               "id": "Advanced",
     *               "name": "Advanced"
     *           }
     *       ],
     *       "Focus Area": [
     *           {
     *               "id": "brain",
     *               "name": "Brain"
     *           },
     *           {
     *               "id": "legs",
     *               "name": "Legs"
     *           },
     *           {
     *               "id": "hips",
     *               "name": "Hips"
     *           }
     *       ],
     *       "Good For": [
     *           {
     *               "id": "stomach",
     *               "name": "Stomach"
     *           },
     *           {
     *               "id": "legs",
     *               "name": "Legs"
     *           }
     *       ],
     *       "Muscles": [
     *           {
     *               "id": "lower-back",
     *               "name": "Lower Back"
     *           },
     *           {
     *               "id": "upper-back",
     *               "name": "Upper Back"
     *           }
     *      ],
     *      "duration": [
     *           {
     *               "id": 5,
     *               "name": 5
     *           },
     *           {
     *               "id": 10,
     *               "name": 10
     *           }
     *      ]
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
     *  "message": "Filters Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getExerciseFilter(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $data = array();
            $data['Level'] = array(
                "key" => "level",
                "filters" => array(
                    array('id' => 'Beginner','name' => 'Beginner'),
                    array('id' => 'Intermediate','name' => 'Intermediate'),
                    array('id' => 'Advanced','name' => 'Advanced')
                ) 
            );

            $focus_area = FocusArea::select('slug', 'name')->where("exercise", 1)->get();
            $fca = array();
            $data['Focus Area'] = array('key' => 'focus_area', 'filters' => array());

            foreach($focus_area as $fa) {
                $fca['id'] = $fa->slug;
                $fca['name'] = $fa->name;
                array_push($data['Focus Area']['filters'], $fca);
            }

            // $good_for = GoodFor::select('slug', 'name')->get();
            // $gfa = array();
            // $data['Good For'] = array('key' => 'good_for', 'filters' => array());

            // foreach($good_for as $gf) {
            //     $gfa['id'] = $gf->slug;
            //     $gfa['name'] = $gf->name;
            //     array_push($data['Good For']['filters'], $gfa);
            // }

            // $muscles = Muscles::select('slug', 'name')->get();
            // $mus = array();
            // $data['Muscles'] = array('key' => 'specific_muscles', 'filters' => array());

            // foreach($muscles as $m) {
            //     $mus['id'] = $m->slug;
            //     $mus['name'] = $m->name;
            //     array_push($data['Muscles']['filters'], $mus);
            // }

            // $data['Type'] = array(
            //     "key" => "type",
            //     "filters" => array(
            //         array('id' => 'warmup','name' => 'Warmup'),
            //         array('id' => 'poststrech','name' => 'Poststrech'),
            //         array('id' => 'exercise','name' => 'Exercise')
            //     )
            // );

            // $duration = Duration::select('duration')->get();
            // $du = array();
            // $data['Duration'] = array('key' => 'duration', 'filters' => array());

            // foreach($duration as $d) {
            //     $du['id'] = $d->duration;
            //     $du['name'] = $d->duration;
            //     array_push($data['Duration']['filters'], $du);
            // }

            // $data['Equipments'] = array('key' => 'equipment', 'filters' => array());
            // $data['Equipments']['filters'] = Equipments::select('id', 'name')->get();
            
            if(empty($data)) {
                return response()->json(['success' =>  false, 'message' => 'Filters not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'filters' => $data], 200);
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
     * @group  Filters
     * 
     * API for Filtering All workouts
     * 
     * @authenticated
     * 
     * @bodyParam  title string The title of the exercise.
     * @bodyParam  duration array The duration min limit of the exercise.
     * @bodyParam  focus_area array The focus area of the exercise.
     * @bodyParam  good_for array The good for of the exercise.
     * @bodyParam  level array The level of the exercise.
     * @bodyParam  equipment array The equipments of the exercise.
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
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/workout?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/workout?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/workout",
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
     *  "message": "Exercise Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function workoutFilter(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $title = request('title');
            $level = request('level');
            $duration = request('duration');
            $focus_area = request('focus_area');
            $good_for = request('good_for');
            $equipment = request('equipment');

            $workouts = Workouts::query();

            if(isset($title)) {
                $workouts = $workouts->select('id', 'title', 'duration', 'focus_area', 'good_for', 'level', 'image', 'calories_burned')->orWhere('title', 'LIKE', "%".$title."%")->orWhereRaw("find_in_set('".$title."',tags)");
            }
            
            if(isset($level)) {
                foreach($level as $lv) {
                    $workouts = $workouts->whereRaw("find_in_set('".$lv."',level)");
                }
            }

            // if(isset($duration)) {
            //     $workouts = $workouts->whereBetween('duration', [$duration[0], $duration[1]]);
            // }

            if(isset($focus_area)) {
                foreach($focus_area as $fa) {
                    $workouts = $workouts->whereRaw("find_in_set('".$fa."',focus_area)");
                }
            }

            // if(isset($good_for)) {
            //     foreach($good_for as $gf) {
            //         $workouts = $workouts->whereRaw("find_in_set('".$gf."',good_for)");
            //     }
            // }

            // if(isset($equipment)) {
            //     foreach($equipment as $eq) {
            //         $workouts = $workouts->whereHas('equipments', function($q) use ($eq) {
            //             $q->where('equipment_id', $eq);
            //         });
            //     }
            // }
            
            $workouts = $workouts->with(array('equipments' => function($query) {
                $query->select('name');
            }))->latest()->paginate(10);

            foreach($workouts as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $good_for = explode(',', $ex['good_for']);
                $level = explode(',', $ex['level']);
                $ex['focus_area'] = $focus_area;
                $ex['good_for'] = $good_for;
                $ex['level'] = $level;
            }

            // $data = $this->paginate($workouts, 10);
            // $data = $data->withPath(url('api/filter/workout/'));

            if($workouts->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Workout not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'workouts' => $workouts], 200);
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
     * @group  Filters
     * 
     * API for getting All workout filters
     * 
     * @authenticated
     * 
     * @response  {
     *   "filters": {
     *       "Level": [
     *           {
     *               "id": "Beginner",
     *               "name": "Beginner"
     *           },
     *           {
     *               "id": "Intermediate",
     *               "name": "Intermediate"
     *           },
     *           {
     *               "id": "Advanced",
     *               "name": "Advanced"
     *           }
     *       ],
     *       "Focus Area": [
     *           {
     *               "id": "brain",
     *               "name": "Brain"
     *           },
     *           {
     *               "id": "legs",
     *               "name": "Legs"
     *           },
     *           {
     *               "id": "hips",
     *               "name": "Hips"
     *           }
     *       ],
     *       "Good For": [
     *           {
     *               "id": "stomach",
     *               "name": "Stomach"
     *           },
     *           {
     *               "id": "legs",
     *               "name": "Legs"
     *           }
     *       ],
     *       "Equipments": [
     *           {
     *               "id": "1",
     *               "name": "Lower Back"
     *           },
     *           {
     *               "id": "2",
     *               "name": "Upper Back"
     *           }
     *      ],
     *      "duration": [
     *           {
     *               "id": 5,
     *               "name": 5
     *           },
     *           {
     *               "id": 10,
     *               "name": 10
     *           }
     *      ]
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
     *  "message": "Filters Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getWorkoutFilter(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $data = array();
            $data['Level'] = array(
                "key" => "level",
                "filters" => array(
                    array('id' => 'Beginner','name' => 'Beginner'),
                    array('id' => 'Intermediate','name' => 'Intermediate'),
                    array('id' => 'Advanced','name' => 'Advanced')
                ) 
            );

            $focus_area = FocusArea::select('slug', 'name')->where("workout", 1)->get();
            $fca = array();
            $data['Focus Area'] = array('key' => 'focus_area', 'filters' => array());

            foreach($focus_area as $fa) {
                $fca['id'] = $fa->slug;
                $fca['name'] = $fa->name;
                array_push($data['Focus Area']['filters'], $fca);
            }

            // $good_for = GoodFor::select('slug', 'name')->get();
            // $gfa = array();
            // $data['Good For'] = array('key' => 'good_for', 'filters' => array());

            // foreach($good_for as $gf) {
            //     $gfa['id'] = $gf->slug;
            //     $gfa['name'] = $gf->name;
            //     array_push($data['Good For']['filters'], $gfa);
            // }

            // $duration = Duration::select('duration')->get();
            // $du = array();
            // $data['Duration'] = array('key' => 'duration', 'filters' => array());

            // foreach($duration as $d) {
            //     $du['id'] = $d->duration;
            //     $du['name'] = $d->duration;
            //     array_push($data['Duration']['filters'], $du);
            // }

            // $data['Equipments'] = array('key' => 'equipment', 'filters' => array());
            // $data['Equipments']['filters'] = Equipments::select('id', 'name')->get();
            
            if(empty($data)) {
                return response()->json(['success' =>  false, 'message' => 'Filters not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'filters' => $data], 200);
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
     * @group  Filters
     * 
     * API for Filtering All programs
     * 
     * @authenticated
     * 
     * @bodyParam  title string The title of the exercise.
     * @bodyParam  duration array The duration min limit of the exercise.
     * @bodyParam  focus_area array The focus area of the exercise.
     * @bodyParam  good_for array The good for of the exercise.
     * @bodyParam  level array The level of the exercise.
     * @bodyParam  equipment array The equipments of the exercise.
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
     *      "frequency": 45,
     *      "length": 5
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/program?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/program?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/program",
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
     *  "message": "Exercise Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function programFilter(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $title = request('title');
            $level = request('level');
            $duration = request('duration');
            $focus_area = request('focus_area');
            $good_for = request('good_for');
            $equipment = request('equipment');

            $programs = Programs::query();

            if(isset($title)) {
                $programs = $programs->select('id', 'title', 'image', 'good_for', 'no_of_days', 'focus_area', 'duration', 'level', 'frequency', 'length')->orWhere('title', 'LIKE', "%".$title."%")->orWhereRaw("find_in_set('".$title."',tags)");
            }
            
            if(isset($level)) {
                foreach($level as $lv) {
                    $programs = $programs->whereRaw("find_in_set('".$lv."',level)");
                }
            }

            // if(isset($duration)) {
            //     $programs = $programs->whereBetween('duration', [$duration[0], $duration[1]]);
            // }

            // if(isset($focus_area)) {
            //     foreach($focus_area as $fa) {
            //         $programs = $programs->whereRaw("find_in_set('".$fa."',focus_area)");
            //     }
            // }

            // if(isset($good_for)) {
            //     foreach($good_for as $gf) {
            //         $programs = $programs->whereRaw("find_in_set('".$gf."',good_for)");
            //     }
            // }

            // if(isset($equipment)) {
            //     foreach($equipment as $eq) {
            //         $programs = $programs->whereHas('equipments', function($q) use ($eq) {
            //             $q->where('equipment_id', $eq);
            //         });
            //     }
            // }
            
            $programs = $programs->with(array('equipments' => function($query) {
                $query->select('name');
            }))->latest()->paginate(10);

            foreach($programs as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $good_for = explode(',', $ex['good_for']);
                $level = explode(',', $ex['level']);
                $ex['focus_area'] = $focus_area;
                $ex['good_for'] = $good_for;
                $ex['level'] = $level;
            }

            //$data = $this->paginate($programs, 10);
            //$data = $data->withPath(url('api/filter/program/'));

            if($programs->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Workout not found.'], 404);
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
     * @group  Filters
     * 
     * API for getting All program filters
     * 
     * @authenticated
     * 
     * @response  {
     *   "filters": {
     *       "Level": [
     *           {
     *               "id": "Beginner",
     *               "name": "Beginner"
     *           },
     *           {
     *               "id": "Intermediate",
     *               "name": "Intermediate"
     *           },
     *           {
     *               "id": "Advanced",
     *               "name": "Advanced"
     *           }
     *       ],
     *       "Focus Area": [
     *           {
     *               "id": "brain",
     *               "name": "Brain"
     *           },
     *           {
     *               "id": "legs",
     *               "name": "Legs"
     *           },
     *           {
     *               "id": "hips",
     *               "name": "Hips"
     *           }
     *       ],
     *       "Good For": [
     *           {
     *               "id": "stomach",
     *               "name": "Stomach"
     *           },
     *           {
     *               "id": "legs",
     *               "name": "Legs"
     *           }
     *       ],
     *       "Equipments": [
     *           {
     *               "id": "1",
     *               "name": "Lower Back"
     *           },
     *           {
     *               "id": "2",
     *               "name": "Upper Back"
     *           }
     *      ],
     *      "duration": [
     *           {
     *               "id": 5,
     *               "name": 5
     *           },
     *           {
     *               "id": 10,
     *               "name": 10
     *           }
     *      ]
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
     *  "message": "Filters Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getProgramFilter(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $data = array();
            $data['Level'] = array(
                "key" => "level",
                "filters" => array(
                    array('id' => 'Beginner','name' => 'Beginner'),
                    array('id' => 'Intermediate','name' => 'Intermediate'),
                    array('id' => 'Advanced','name' => 'Advanced')
                ) 
            );

            // $focus_area = FocusArea::select('slug', 'name')->get();
            // $fca = array();
            // $data['Focus Area'] = array('key' => 'focus_area', 'filters' => array());

            // foreach($focus_area as $fa) {
            //     $fca['id'] = $fa->slug;
            //     $fca['name'] = $fa->name;
            //     array_push($data['Focus Area']['filters'], $fca);
            // }

            // $good_for = GoodFor::select('slug', 'name')->get();
            // $gfa = array();
            // $data['Good For'] = array('key' => 'good_for', 'filters' => array());

            // foreach($good_for as $gf) {
            //     $gfa['id'] = $gf->slug;
            //     $gfa['name'] = $gf->name;
            //     array_push($data['Good For']['filters'], $gfa);
            // }

            // $duration = Duration::select('duration')->get();
            // $du = array();
            // $data['Duration'] = array('key' => 'duration', 'filters' => array());

            // foreach($duration as $d) {
            //     $du['id'] = $d->duration;
            //     $du['name'] = $d->duration;
            //     array_push($data['Duration']['filters'], $du);
            // }

            // $data['Equipments'] = array('key' => 'equipment', 'filters' => array());
            // $data['Equipments']['filters'] = Equipments::select('id', 'name')->get();
            
            if(empty($data)) {
                return response()->json(['success' =>  false, 'message' => 'Filters not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'filters' => $data], 200);
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
     * @group  Filters
     * 
     * API for Filtering All split
     * 
     * @authenticated
     * 
     * @bodyParam  title string The title of the exercise.
     * @bodyParam  duration array The duration min limit of the exercise.
     * @bodyParam  focus_area array The focus area of the exercise.
     * @bodyParam  good_for array The good for of the exercise.
     * @bodyParam  level array The level of the exercise.
     * @bodyParam  equipment array The equipments of the exercise.
     * 
     * @response  {
     *  "programs": {
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
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/split?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/split?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/split",
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
     *  "message": "Exercise Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function splitFilter(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $title = request('title');
            $level = request('level');
            $duration = request('duration');
            $focus_area = request('focus_area');
            $good_for = request('good_for');
            $equipment = request('equipment');

            $splits = Splits::query();

            if(isset($title)) {
                $splits = $splits->select('id', 'title', 'focus_area', 'good_for', 'type', 'duration', 'level', 'frequency')->orWhere('title', 'LIKE', "%".$title."%")->orWhereRaw("find_in_set('".$title."',tags)");
            }
            
            if(isset($level)) {
                foreach($level as $lv) {
                    $splits = $splits->whereRaw("find_in_set('".$lv."',level)");
                }
            }

            // if(isset($duration)) {
            //     $splits = $splits->orWhereBetween('duration', [$duration[0], $duration[1]]);
            // }

            // if(isset($focus_area)) {
            //     foreach($focus_area as $fa) {
            //         $splits = $splits->orWhereRaw("find_in_set('".$fa."',focus_area)");
            //     }
            // }

            // if(isset($good_for)) {
            //     foreach($good_for as $gf) {
            //         $splits = $splits->orWhereRaw("find_in_set('".$gf."',good_for)");
            //     }
            // }

            // if(isset($equipment)) {
            //     foreach($equipment as $eq) {
            //         $splits = $splits->whereHas('equipments', function($q) use ($eq) {
            //             $q->where('equipment_id', $eq);
            //         });
            //     }
            // }
            
            $splits = $splits->with(array('equipments' => function($query) {
                $query->select('name');
            }))->latest()->paginate(10);

            foreach($splits as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $good_for = explode(',', $ex['good_for']);
                $level = explode(',', $ex['level']);
                $ex['focus_area'] = $focus_area;
                $ex['good_for'] = $good_for;
                $ex['level'] = $level;
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
     * @group  Filters
     * 
     * API for getting All split filters 
     * 
     * @authenticated 
     * 
     * @response  {
     *   "filters": {
     *       "Level": [
     *           {
     *               "id": "Beginner",
     *               "name": "Beginner"
     *           },
     *           {
     *               "id": "Intermediate",
     *               "name": "Intermediate"
     *           },
     *           {
     *               "id": "Advanced",
     *               "name": "Advanced"
     *           }
     *       ],
     *       "Focus Area": [
     *           {
     *               "id": "brain",
     *               "name": "Brain"
     *           },
     *           {
     *               "id": "legs",
     *               "name": "Legs"
     *           },
     *           {
     *               "id": "hips",
     *               "name": "Hips"
     *           }
     *       ],
     *       "Good For": [
     *           {
     *               "id": "stomach",
     *               "name": "Stomach"
     *           },
     *           {
     *               "id": "legs",
     *               "name": "Legs"
     *           }
     *       ],
     *       "Equipments": [
     *           {
     *               "id": "1",
     *               "name": "Lower Back"
     *           },
     *           {
     *               "id": "2",
     *               "name": "Upper Back"
     *           }
     *      ],
     *      "duration": [
     *           {
     *               "id": 5,
     *               "name": 5
     *           },
     *           {
     *               "id": 10,
     *               "name": 10
     *           }
     *      ]
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
     *  "message": "Filters Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getSplitFilter(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $data = array();
            $data['Level'] = array(
                "key" => "level",
                "filters" => array(
                    array('id' => 'Beginner','name' => 'Beginner'),
                    array('id' => 'Intermediate','name' => 'Intermediate'),
                    array('id' => 'Advanced','name' => 'Advanced')
                ) 
            );

            // $focus_area = FocusArea::select('slug', 'name')->get();
            // $fca = array();
            // $data['Focus Area'] = array('key' => 'focus_area', 'filters' => array());

            // foreach($focus_area as $fa) {
            //     $fca['id'] = $fa->slug;
            //     $fca['name'] = $fa->name;
            //     array_push($data['Focus Area']['filters'], $fca);
            // }

            // $good_for = GoodFor::select('slug', 'name')->get();
            // $gfa = array();
            // $data['Good For'] = array('key' => 'good_for', 'filters' => array());

            // foreach($good_for as $gf) {
            //     $gfa['id'] = $gf->slug;
            //     $gfa['name'] = $gf->name;
            //     array_push($data['Good For']['filters'], $gfa);
            // }

            // $duration = Duration::select('duration')->get();
            // $du = array();
            // $data['Duration'] = array('key' => 'duration', 'filters' => array());

            // foreach($duration as $d) {
            //     $du['id'] = $d->duration;
            //     $du['name'] = $d->duration;
            //     array_push($data['Duration']['filters'], $du);
            // }

            // $data['Equipments'] = array('key' => 'equipment', 'filters' => array());
            // $data['Equipments']['filters'] = Equipments::select('id', 'name')->get();
            
            if(empty($data)) {
                return response()->json(['success' =>  false, 'message' => 'Filters not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'filters' => $data], 200);
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
     * @group  Filters
     * 
     * API for Filtering All streches 
     * 
     * @authenticated
     * 
     * @bodyParam  title string The title of the exercise.
     * @bodyParam  duration array The duration min limit of the exercise.
     * @bodyParam  focus_area array The focus area of the exercise.
     * @bodyParam  specific_muscles array The specific muscles of the exercise.
     * @bodyParam  good_for array The good for of the exercise.
     * @bodyParam  type array The type of the exercise.
     * @bodyParam  level array The level of the exercise.
     * @bodyParam  equipment array The equipments of the exercise.
     * 
     * @response  {
     *  "streches": {
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
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/streches/images/1623067648.jpg"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/strech?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/strech?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/strech",
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
     *  "message": "Strech Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function strechFilter(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $title = request('title');
            $level = request('level');
            $duration = request('duration');
            $focus_area = request('focus_area');
            $specific_muscles = request('specific_muscles');
            $good_for = request('good_for');
            $type = request('type');
            $equipment = request('equipment');

            $exercises = Strech::query();

            if(isset($title)) {
                $exercises = $exercises->select('id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->orWhere('title', 'LIKE', "%".$title."%")->orWhereRaw("find_in_set('".$title."',tags)");
            }
            
            if(isset($level)) {
                $exercises = $exercises->whereIn('level', $level);
            }

            // if(isset($duration)) {
            //     $exercises = $exercises->whereBetween('duration', [$duration[0], $duration[1]]);
            // }

            if(isset($focus_area)) {
                foreach($focus_area as $fa) {
                    $exercises = $exercises->whereRaw("find_in_set('".$fa."',focus_area)");
                }
            }

            // if(isset($specific_muscles)) {
            //     foreach($specific_muscles as $sm) {
            //         $exercises = $exercises->whereRaw("find_in_set('".$sm."',specific_muscles)");
            //     }
            // }

            // if(isset($good_for)) {
            //     foreach($good_for as $gf) {
            //         $exercises = $exercises->whereRaw("find_in_set('".$gf."',good_for)");
            //     }
            // }

            // if(isset($type)) {
            //     foreach($type as $ty) {
            //         $exercises = $exercises->whereRaw("find_in_set('".$ty."',type)");
            //     }
            // }

            // if(isset($equipment)) {
            //     foreach($equipment as $eq) {
            //         $exercises = $exercises->whereHas('equipments', function($q) use ($eq) {
            //             $q->where('equipment_id', $eq);
            //         });
            //     }
            // }
            
            $exercises = $exercises->with(array('equipments' => function($query) {
                $query->select('name');
            }))->latest()->paginate(10);

            foreach($exercises as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $type = explode(',', $ex['type']);
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['type'] = $type;
            }

            if($exercises->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Streches not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'streches' => $exercises], 200);
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
     * @group  Filters
     * 
     * API for getting All strech filters
     * 
     * @authenticated
     * 
     * @response  {
     *   "filters": {
     *       "Level": [
     *           {
     *               "id": "Beginner",
     *               "name": "Beginner"
     *           },
     *           {
     *               "id": "Intermediate",
     *               "name": "Intermediate"
     *           },
     *           {
     *               "id": "Advanced",
     *               "name": "Advanced"
     *           }
     *       ],
     *       "Focus Area": [
     *           {
     *               "id": "brain",
     *               "name": "Brain"
     *           },
     *           {
     *               "id": "legs",
     *               "name": "Legs"
     *           },
     *           {
     *               "id": "hips",
     *               "name": "Hips"
     *           }
     *       ],
     *       "Good For": [
     *           {
     *               "id": "stomach",
     *               "name": "Stomach"
     *           },
     *           {
     *               "id": "legs",
     *               "name": "Legs"
     *           }
     *       ],
     *       "Muscles": [
     *           {
     *               "id": "lower-back",
     *               "name": "Lower Back"
     *           },
     *           {
     *               "id": "upper-back",
     *               "name": "Upper Back"
     *           }
     *      ],
     *      "duration": [
     *           {
     *               "id": 5,
     *               "name": 5
     *           },
     *           {
     *               "id": 10,
     *               "name": 10
     *           }
     *      ]
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
     *  "message": "Filters Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getStrechFilter() {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $data = array();
            $data['Level'] = array(
                "key" => "level",
                "filters" => array(
                    array('id' => 'Beginner','name' => 'Beginner'),
                    array('id' => 'Intermediate','name' => 'Intermediate'),
                    array('id' => 'Advanced','name' => 'Advanced')
                ) 
            );

            $focus_area = FocusArea::select('slug', 'name')->get();
            $fca = array();
            $data['Focus Area'] = array('key' => 'focus_area', 'filters' => array());

            foreach($focus_area as $fa) {
                $fca['id'] = $fa->slug;
                $fca['name'] = $fa->name;
                array_push($data['Focus Area']['filters'], $fca);
            }

            // $good_for = GoodFor::select('slug', 'name')->get();
            // $gfa = array();
            // $data['Good For'] = array('key' => 'good_for', 'filters' => array());

            // foreach($good_for as $gf) {
            //     $gfa['id'] = $gf->slug;
            //     $gfa['name'] = $gf->name;
            //     array_push($data['Good For']['filters'], $gfa);
            // }

            // $muscles = Muscles::select('slug', 'name')->get();
            // $mus = array();
            // $data['Muscles'] = array('key' => 'specific_muscles', 'filters' => array());

            // foreach($muscles as $m) {
            //     $mus['id'] = $m->slug;
            //     $mus['name'] = $m->name;
            //     array_push($data['Muscles']['filters'], $mus);
            // }

            // $data['Type'] = array(
            //     "key" => "type",
            //     "filters" => array(
            //         array('id' => 'warmup','name' => 'Warmup'),
            //         array('id' => 'poststrech','name' => 'Poststrech'),
            //         array('id' => 'exercise','name' => 'Exercise')
            //     )
            // );

            // $duration = Duration::select('duration')->get();
            // $du = array();
            // $data['Duration'] = array('key' => 'duration', 'filters' => array());

            // foreach($duration as $d) {
            //     $du['id'] = $d->duration;
            //     $du['name'] = $d->duration;
            //     array_push($data['Duration']['filters'], $du);
            // }

            // $data['Equipments'] = array('key' => 'equipment', 'filters' => array());
            // $data['Equipments']['filters'] = Equipments::select('id', 'name')->get();
            
            if(empty($data)) {
                return response()->json(['success' =>  false, 'message' => 'Filters not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'filters' => $data], 200);
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
