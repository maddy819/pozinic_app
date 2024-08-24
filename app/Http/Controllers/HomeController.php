<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use App\Settings;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $setting = Settings::all()->first();
        $role = Auth::user()->user_type;

        if($role == "customer"){ return redirect('/customer/verified'); }

        if($role == "admin"){ return redirect('/dashboard'); }
    }
}
