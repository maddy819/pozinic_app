<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Settings;
use DataTables;
use App\Plans;
use JWTAuth;
use File;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class PlansController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $pageTitle = "Plan's";
        $plans = Plans::all();
        return view('admin.plans', compact('setting', 'pageTitle', 'plans'));
    }

    public function store_plan(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string'],
            'price' => ['required', 'numeric'],
            'duration' => ['required', 'numeric'],
            'duration_type' => ['required', 'string']
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Plan") {
            $planData = array('name' => request('name'), 'price' => request('price'), 'plan_type' => request('plan_type'), 'duration' => request('duration'), 'duration_type' => request('duration_type'), 'description' => request('description'));
            $plan = Plans::create($planData);

            if($plan) {
                return response()->json(['success'=>'Plan Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            $planData = array('name' => request('name'), 'price' => request('price'), 'plan_type' => request('plan_type'), 'duration' => request('duration'), 'duration_type' => request('duration_type'), 'description' => request('description'));
            $res1 = Plans::where('id', $id)->update($planData);

            if($res1) {
                return response()->json(['success' => 'Plan Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_plan(Request $request) {
        $pId = request('pId');
        $plan = Plans::where('id', $pId)->get()->first();
        return \Response::json($plan);
    }

    public function delete_plan(Request $request) {
        $id = request('id');
        $res = Plans::where('id', $id)->delete();
        if($res) {
            return redirect()->back()->with('success', 'Plan Deleted Successfully.');
        } else { 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again.');
        }
    }
}