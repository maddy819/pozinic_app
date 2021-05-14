<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Settings;
use App\User;

class AdminDashboard extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $pageTitle = 'Dashboard';
        return view('admin.index', compact('setting', 'pageTitle'));
    }
}
