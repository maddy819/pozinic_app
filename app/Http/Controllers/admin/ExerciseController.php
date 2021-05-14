<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\ExerciseVariations;
use App\Settings;
use App\User;
use App\Exercises;

class ExerciseController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $exercises = Exercises::all();
        $pageTitle = 'Exercises';
        return view('admin.exercises', compact('setting', 'exercises', 'pageTitle'));
    }

    public function store_exercise(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'code' => ['required', 'string', 'max:60'],
            'duration' => ['required', 'string', 'max:60'],
            'instruction' => ['required', 'string'],
            'description' => ['required', 'string'],
            'reps' => ['required', 'string', 'max:60'],
            'good_for' => ['required', 'string'],
            'focus_area' => ['required', 'string', 'max:60'],
            'specific_muscles' => ['required', 'string'],
            'weight' => ['string', 'max:60'],
            'level' => ['required', 'string', 'max:60'],
            'tip_video' => ['max:2048'],
            'image' => ['image', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
            'equipments' => ['required', 'array', 'min:1'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Exercise") {
            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefileurl = url('uploads/exercises/images/'.$imagefilename);
                $imagefile->move('uploads/exercises/images/', $imagefilename);
            } else {
                $imagefileurl = url('uploads/default-placeholder.png');
            }

            if($request->hasfile('tip_video')){
                $videofile = $request->file('tip_video');
                $videoext = $videofile->getClientOriginalExtension();
                $videofilename = time().'.'.$videoext;
                $videofileurl = url('uploads/exercises/videos/'.$videofilename);
                $videofile->move('uploads/categories/videos/', $videofilename);
            } else {
                $videofileurl = NULL;
            }
    
            $exerciseData = array('title' => request('title'), 'code' => request('code'), 'duration' => request('duration'), 'slug' => Str::slug(request('title')), 'instructions' => request('instruction'), 'image' => $imagefileurl, 'description' => request('description'), 'reps' => request('reps'), 'focus_area' => request('focus_area'), 'specific_muscles' => request('specific_muscles'), 'good_for' => request('good_for'), 'level' => request('level'), 'weight' => request('weight'), 'tags' => request('tags'), 'video_link' => request('video_link'), 'tip_video' => $videofileurl);

            $exercise = Exercises::create($exerciseData);

            if($exercise) {
                $exercise->equipments()->attach(request('equipments'));
                return response()->json(['success'=>'Exercise Posted Successfully.']);
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
                $new_image_url = url('uploads/exercises/images/'.$new_image);
                $image->move('uploads/exercises/images/', $new_image);
            }

            if(empty($request->file('tip_video'))) {
                $new_video_url = request('old_tip_video');
            } else {
                if(!empty(request('old_tip_video'))) {
                    File::delete(request('old_tip_video'));
                }
    
                $tip_video = $request->file('tip_video');
                $ext_video =  $image->getClientOriginalExtension();
                $new_video = time().'.'.$ext_video;
                $new_video_url = url('uploads/exercises/videos/'.$new_video);
                $tip_video->move('uploads/exercises/videos/', $new_video);
            }

            $exerciseData = array('title' => request('title'), 'code' => request('code'), 'duration' => request('duration'), 'slug' => Str::slug(request('title')), 'instructions' => request('instruction'), 'image' => $new_image_url, 'description' => request('description'), 'reps' => request('reps'), 'focus_area' => request('focus_area'), 'specific_muscles' => request('specific_muscles'), 'good_for' => request('good_for'), 'level' => request('level'), 'weight' => request('weight'), 'tags' => request('tags'), 'video_link' => request('video_link'), 'tip_video' => $new_video_url);

            $res1 = Exercises::where('id', $id)->update($exerciseData);

            if($res1) {
                $Exercise = Exercises::find($id);
                $Exercise->equipments()->sync(request('equipments'));
                return response()->json(['success' => 'Exercise Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_exercise(Request $request) {
        $exId = request('exId');
        $exercise = Exercises::with('equipments')->where('id', $exId)->get()->first();
        return \Response::json($exercise);
    }

    public function variation(Exercises $exercise) {
        $setting = Settings::all()->first();
        $exerciseVariation = $exercise->exerciseVariation()->get();
        $pageTitle = $exercise->title.' Variations List';
        return view('admin.exerciseVariations', compact('exercise', 'pageTitle', 'exerciseVariation', 'setting'));
    }

    public function storeVariation(Request $request) {
        $validator = Validator::make($request->all(), [
            'variation_name' => ['required', 'string', 'max:60'],
            'duration' => ['required', 'string', 'max:60'],
            'reps' => ['required', 'string', 'max:60'],
            'rest_duration' => ['required', 'string', 'max:60'],
        ]);

        if(request('save') == "Post Variation") {
            $exerciseVariationsData = array('exercise_code' => request('exCode'), 'variation_name' => request('variation_name'), 'duration' => request('duration'), 'reps' => request('reps'), 'rest_duration' => request('rest_duration'));

            if(ExerciseVariations::create($exerciseVariationsData)) {
                return response()->json(['success'=>'Variation Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            $exerciseVariationsData = array('exercise_code' => request('exCode'), 'variation_name' => request('variation_name'), 'duration' => request('duration'), 'reps' => request('reps'), 'rest_duration' => request('rest_duration'));

            $res1 = ExerciseVariations::where('id', $id)->update($exerciseVariationsData);

            if($res1) {
                return response()->json(['success' => 'Variation Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_variation() {
        $evId = request('evId');
        $exerciseVariation = ExerciseVariations::where('id', $evId)->get()->first();
        return \Response::json($exerciseVariation);
    }
}
