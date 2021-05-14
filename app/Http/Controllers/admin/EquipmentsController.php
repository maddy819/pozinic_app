<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Settings;
use App\User;
use App\Exercises;
use App\Equipments;

class EquipmentsController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $equipments = Equipments::all();
        $pageTitle = 'Equipments';
        return view('admin.equipments', compact('setting', 'equipments', 'pageTitle'));
    }

    public function store_equipment(Request $request){
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:60'],
            'description' => ['required', 'string'],
            'weight' => ['required', 'string', 'max:60']
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Equipment") {
            $equipment = array('name' => request('name'), 'slug' => Str::slug(request('name')), 'description' => request('description'), 'weight' => request('weight'));

            if(Equipments::create($equipment)) {
                return response()->json(['success'=>'Equipment Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            $equipment = array('name' => request('name'), 'slug' => Str::slug(request('name')), 'description' => request('description'), 'weight' => request('weight'));

            $res1 = Equipments::where('id', $id)->update($equipment);

            if($res1) {
                return response()->json(['success' => 'Equipment Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_equipment() {
        $eqId = request('eqId');
        $equipment = Equipments::where('id', $eqId)->get()->first();
        return \Response::json($equipment);
    }
}