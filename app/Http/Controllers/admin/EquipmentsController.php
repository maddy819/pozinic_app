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
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

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
            'weight' => ['required', 'numeric']
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

    public function edit_equipment(Request $request) {
        $eqId = request('eqId');
        $equipment = Equipments::where('id', $eqId)->get()->first();
        return \Response::json($equipment);
    }

    public function deleteEquipment(Request $request) {
        $id = request('id');
        $equipment = Equipments::find($id);
        $equipment->exercises()->detach($equipment->exercises()->get()->pluck('id'));
        $res = Equipments::where('id', $id)->delete();
        //dd($res);
        if($res) 
            return redirect()->back()->with('success', 'Equipment Deleted Successfully...');
        else 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
    }

    /**
     * @group  Equipments
     * 
     * @authenticated
     *
     * API for getting All equipments
     * 
     * @response  {
     *  "equipments": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "name": "Full Body Blaster",
     *      "slug": "full-body-blaster",
     *      "weight": "500",
     *      "description": "<p>fadsfadfda</p>",
     *      "created_at": "2021-05-13 06:56:08",
     *      "updated_at": "2021-06-07 12:07:28"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/equipments/all?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/equipments/all?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/equipments/all",
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

    public function getAllEquipments() {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $equipments = Equipments::paginate(); 

            if($equipments->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Equipments not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'equipments' => $equipments], 200);
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
}