<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Settings;
use File;
use Illuminate\Support\Facades\Validator;
use Auth;

class SettingController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $pageTitle = 'Settings';
        return view('admin.settings', compact('setting', 'pageTitle'));
    }

    public function update(Request $request) {
        $this->validate($request,[
            'title' => 'required|string',
            'email' => 'required|string|email|max:255',
            'logo' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'favicon' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'contact' => 'required|numeric|min:10',
            'website' => 'required|url',
            'description' => 'required|string',
            'tags' => 'required|string',
            'address' => 'required|string'
        ]);

        $id = request('id');

        if(empty($request->file('logo'))) {
            $new_logo = request('old_logo');
        } else {
            if(!empty(request('old_logo'))) {
                File::delete('uploads/'.request('old_logo'));
            }

            $logo = $request->file('logo');
            $ext_logo =  $logo->getClientOriginalExtension();
            $new_logo = time().'.'.$ext_logo;
            $logo->move('uploads/', $new_logo);
        }

        if(empty($request->file('favicon'))) {
            $new_favicon = request('old_favicon');
        } else {
            if(!empty(request('old_favicon'))) {
                File::delete('uploads/'.request('old_favicon'));
            }

            $favicon = $request->file('favicon');
            $ext_favicon =  $favicon->getClientOriginalExtension();
            $new_favicon = time().'.'.$ext_favicon;
            $favicon->move('uploads/', $new_favicon);
        }

        $setting = array(
            'title' => request('title'),
            'email' => request('email'),
            'logo' => $new_logo,
            'favicon' => $new_favicon,
            'contact' => request('contact'),
            'website' => request('website'),
            'description' => request('description'),
            'tags' => request('tags'),
            'address' => request('address')
        );

        Settings::where('id', $id)->update($setting);
        return redirect()->back()->with('message','Settings Sucessfully Updated!');
    }
}