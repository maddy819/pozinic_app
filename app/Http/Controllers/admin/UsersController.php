<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\User;
use App\UserPlaylist;
use App\Settings;
use Auth;
use DataTables;

class UsersController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $pageTitle = 'Users';
        return view('admin.users', compact('pageTitle', 'setting'));
    }

    public function users(Request $request) {
        if ($request->ajax()) {
            $data = User::select('id', 'name', 'email', 'mobile', 'gender', 'age', 'level', 'height', 'weight')->where('user_type', 'customer');
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){

                    $btn = '<div class="dropdown">
                                <button type="button" class="btn btn-icon btn-sm btn-secondary btn-rounded btn-outline-secondary" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#" onclick="view_playlists('.$row->id.')">View Playlists</a>
                                    <a class="dropdown-item" href="#" onclick="favourite_resources('.$row->id.')">Favourite Resources</a>
                                    <a class="dropdown-item" href="#" onclick="recent_resources('.$row->id.')">Recent Resources</a>
                                    <a class="dropdown-item" href="#" onclick="user_program_subscriptions('.$row->id.')">Program Subscriptions</a>
                                    <a class="dropdown-item" href="#" onclick="active_plan('.$row->id.')">Active Plan</a>
                                </div>
                            </div>';
       
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        
        return view('users');
    }

    public function activePlan(Request $request) {
        if ($request->ajax()) {
            $data = User::with('plans')->where('id', $request->id)->get()->first();
            if(!empty($data)) {
                if(count($data->plans) <= 0) {
                    $user = array(array(
                        'name' => '',
                        'plan_type' => '',
                        'plan_start' => '',
                        'plan_end' => ''
                    ));

                    return Datatables::of($user)->addIndexColumn()->toJson(true);
                } else {
                    $user = array(array(
                        'name' => $data->plans->first()->name,
                        'plan_type' => $data->plans->first()->plan_type,
                        'plan_start' => date("F jS, Y", strtotime($data->plans->first()->pivot->plan_start)),
                        'plan_end' => date("F jS, Y", strtotime($data->plans->first()->pivot->plan_end))
                    ));
                    
                    return Datatables::of($user)->addIndexColumn()->toJson(true);
                }
            } 
        }
    }

    public function userProgramSubscriptions(int $id) {
        try {
            $user = User::findOrFail($id);
            $setting = Settings::all()->first();
            $pageTitle = $user->name.' Program Subscriptions';
            $programSubscriptions = $user->subscriptions;
            //dd($programSubscriptions);
            return view('admin.userProgramSubscriptions', compact('pageTitle', 'setting', 'user', 'programSubscriptions'));
        } catch(\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    public function viewPlaylists(Request $request) {
        try {
            $user = User::findOrFail(request('id'));
            $playlists = $user->userPlaylist;
            $setting = Settings::all()->first();
            $pageTitle = 'View Playlists';
            return view('admin.playlist', compact('pageTitle', 'setting', 'playlists', 'user'));
        } catch(\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    public function userPlaylistSavedResources(int $id) {
        try {
            $playlist = UserPlaylist::findOrFail($id);
            $savedExercises = $playlist->savedExercises;
            $savedWorkouts = $playlist->savedWorkouts;
            $savedPrograms = $playlist->savedPrograms;
            $savedSplits = $playlist->savedSplits;
            $savedStreches = $playlist->savedStreches;
            $setting = Settings::all()->first();
            $pageTitle = 'Saved Resources';
            return view('admin.savedResources', compact('pageTitle', 'setting', 'savedExercises', 'savedWorkouts', 'savedPrograms', 'savedSplits', 'savedStreches'));
        } catch(\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    public function favouriteResources(int $id) {
        try {
            $user = User::findOrFail($id);
            $favouriteExercises = $user->favouriteExercises;
            $favouriteWorkouts = $user->favouriteWorkouts;
            $favouritePrograms = $user->favouritePrograms;
            $favouriteSplits = $user->favouriteSplits;
            $favouriteStreches = $user->favouriteStreches;
            $setting = Settings::all()->first();
            $pageTitle = 'Favourite Resources';
            return view('admin.favouriteResources', compact('pageTitle', 'setting', 'favouriteExercises', 'favouriteWorkouts', 'favouritePrograms', 'favouriteSplits', 'favouriteStreches'));
        } catch(\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    public function recentResources(int $id) {
        try {
            $user = User::findOrFail($id);
            $recentExercises = $user->recentExercises;
            $recentWorkouts = $user->recentWorkouts;
            $recentPrograms = $user->recentPrograms;
            $recentSplits = $user->recentSplits;
            $recentStreches = $user->recentStreches;
            $setting = Settings::all()->first();
            $pageTitle = 'Recent Resources';
            return view('admin.recentResources', compact('pageTitle', 'setting', 'recentExercises', 'recentWorkouts', 'recentPrograms', 'recentSplits', 'recentStreches'));
        } catch(\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}