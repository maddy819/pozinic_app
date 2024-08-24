<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Category;
use App\Settings;
use Auth;
use File;

class CategoriesController extends Controller
{
    public function index() {
        $categories = Category::orderBy('id', 'DESC')->get();
        $setting = Settings::all()->first();
        $pageTitle = 'Categories';
        return view('admin.categories', compact('pageTitle', 'setting', 'categories'));
    }

    public function store_category(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:60'],
            'featured' => ['required', 'numeric'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Category") {
            $category = array('name' => request('name'), 'slug' => str_slug(request('name')), 'description' => request('description'), 'featured' => request('featured'), 'featured_for' => request('featured_for'));

            if(Category::create($category)) {
                return response()->json(['success'=>'Category Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            $category = array('name' => request('name'), 'slug' => str_slug(request('name')), 'description' => request('description'), 'featured' => request('featured'), 'featured_for' => request('featured_for'));

            $res1 = Category::where('id', $id)->update($category);

            if($res1) {
                return response()->json(['success' => 'Category Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_category(Request $request) {
        $catId = request('catId');
        $category = Category::where('id', $catId)->get()->first();
        return \Response::json($category);
    }

    public function delete_category(Request $request) {
        $id = request('id');
        $res = Category::where('id', $id)->delete();
        //dd($res);
        if($res) 
            return redirect()->back()->with('success', 'Category Deleted Successfully.');
        else 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again.');
    }
}
