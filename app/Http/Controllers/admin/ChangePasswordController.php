<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\Hash;
use App\Settings;
use App\User;

class ChangePasswordController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $pageTitle = 'Change Password';
        return view('admin.changePassword', compact('setting', 'pageTitle'));
    }

    public function changePassword(Request $request) {
        $validator = Validator::make($request->all(), [
            'current_password' => ['required', new MatchOldPassword],
            'new_password' => ['required'],
            'new_confirm_password' => ['same:new_password'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->messages()->first());
        }
        
        User::find(auth()->user()->id)->update(['password'=> Hash::make($request->new_password)]);
        return redirect()->back()->with('success', 'Password Updated Successfully...');
    }
}
