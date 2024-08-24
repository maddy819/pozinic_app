<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Settings;
use App\Exercises;
use App\Nutrition;
use App\Programs;
use App\Workouts;
use App\User;

class AdminDashboard extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $exercises = Exercises::count();
        $workouts = Workouts::count();
        $programs = Programs::count();
        $nutritions = Nutrition::count();
        $pageTitle = 'Dashboard';
        return view('admin.index', compact('setting', 'pageTitle', 'exercises', 'workouts', 'programs', 'nutritions'));
    }
}
