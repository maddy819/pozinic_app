<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Settings;
use App\User;
use App\Workouts;
use App\Exercises;

class WorkoutsController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $workouts = Workouts::all();
        $warmUps = Exercises::all();
        $postStreches = Exercises::all();
        $pageTitle = 'Workouts';
        return view('admin.workouts', compact('setting', 'workouts', 'warmUps', 'postStreches', 'pageTitle'));
    }

    public function store_workout(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'duration' => ['required', 'string', 'max:60'],
            'instruction' => ['required', 'string'],
            'description' => ['required', 'string'],
            'exercises' => ['required', 'array', 'min:1'],
            'focus_area' => ['required', 'string', 'max:60'],
            'level' => ['required', 'string', 'max:60'],
            'image' => ['image', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
            'equipments' => ['required', 'string', 'max:60'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Workout") {
            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefileurl = url('uploads/workouts/images/'.$imagefilename);
                $imagefile->move('uploads/workouts/images/', $imagefilename);
            } else {
                $imagefileurl = url('uploads/default-placeholder.png');
            }
    
            $workoutData = array('title' => request('title'), 'duration' => request('duration'), 'slug' => Str::slug(request('title')), 'instructions' => request('instruction'), 'image' => $imagefileurl, 'description' => request('description'), 'focus_area' => request('focus_area'), 'level' => request('level'), 'equipments' => request('equipments'));

            $workout = Workouts::create($workoutData);

            if($workout) {
                $workout->exercises()->attach(request('exercises'));
                return response()->json(['success'=>'Workout Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            if(empty($request->file('image'))) {
                $new_image_url = request('old_image');
            } else {
                if(!empty(request('old_image'))) {
                    File::delete(request('old_image'));
                }
    
                $image = $request->file('image');
                $ext_image =  $image->getClientOriginalExtension();
                $new_image = time().'.'.$ext_image;
                $new_image_url = url('uploads/workouts/images/'.$new_image);
                $image->move('uploads/workouts/images/', $new_image);
            }

            $Workouts = array('title' => request('title'), 'duration' => request('duration'), 'slug' => Str::slug(request('title')), 'instructions' => request('instruction'), 'image' => $new_image_url, 'description' => request('description'), 'focus_area' => request('focus_area'), 'level' => request('level'), 'equipments' => request('equipments'));

            $res1 = Workouts::where('id', $id)->update($Workouts);

            if($res1) {
                $workout = Workouts::find($id);
                $workout->exercises()->sync(request('exercises'));
                return response()->json(['success' => 'Workout Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_workout(Request $request) {
        $wkId = request('wkId');
        $workout = Workouts::with('exercises')->where('id', $wkId)->get()->first();
        return \Response::json($workout);
    }
}
