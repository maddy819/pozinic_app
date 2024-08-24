<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use App\UserSubscription;
use App\UserSplitSubscription;
use App\UserPlaylist;
use App\Exercises;
use App\Workouts;
use App\Programs;
use App\Splits;
use App\Strech;
use App\Plans;
use App\UsersPlan;

class User extends Authenticatable implements JWTSubject, MustVerifyEmail
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'user_type', 'password', 'mobile', 'image', 'gender', 'age', 'level', 'height', 'weight', 'fitness_goal', 'email_verified_at', 'type', 'remember_token', 'onboarding_status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'phone_verified_at' => 'datetime',
    ];

    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier() {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims() {
        return [];
    }

    public function favouriteExercises() {
        return $this->belongsToMany(Exercises::class, 'user_favourite', 'user_id', 'exercise_id')->select('exercises.id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function favouriteWorkouts() {
        return $this->belongsToMany(Workouts::class, 'user_favourite', 'user_id', 'workout_id')->select('workouts.id', 'title', 'duration', 'focus_area', 'level', 'image', 'good_for', 'calories_burned')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function favouritePrograms() {
        return $this->belongsToMany(Programs::class, 'user_favourite', 'user_id', 'program_id')->select('programs.id', 'title', 'image', 'good_for', 'no_of_days', 'focus_area', 'duration', 'level')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function favouriteSplits() {
        return $this->belongsToMany(Splits::class, 'user_favourite', 'user_id', 'split_id')->select('splits.id', 'title', 'image', 'focus_area', 'good_for', 'type', 'duration', 'level')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function favouriteStreches() {
        return $this->belongsToMany(Strech::class, 'user_favourite', 'user_id', 'strech_id')->select('streches.id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function recentExercises() {
        return $this->belongsToMany(Exercises::class, 'user_recents', 'user_id', 'exercise_id')->select('exercises.id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function recentWorkouts() {
        return $this->belongsToMany(Workouts::class, 'user_recents', 'user_id', 'workout_id')->select('workouts.id', 'title', 'duration', 'focus_area', 'level', 'image', 'good_for', 'calories_burned')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function recentPrograms() {
        return $this->belongsToMany(Programs::class, 'user_recents', 'user_id', 'program_id')->select('programs.id', 'title', 'image', 'good_for', 'no_of_days', 'focus_area', 'duration', 'level')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function recentSplits() {
        return $this->belongsToMany(Splits::class, 'user_recents', 'user_id', 'split_id')->select('splits.id', 'title', 'image', 'focus_area', 'good_for', 'type', 'duration', 'level')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function recentStreches() {
        return $this->belongsToMany(Strech::class, 'user_recents', 'user_id', 'strech_id')->select('streches.id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    // public function subscriptions() {
    //     return $this->hasMany(UserSubscription::class)->with('program')->withCount(array('userProgress' => function($query) {
    //         $query->where('date', date('Y-m-d'));
    //     }));
    // }

    public function subscriptions() {
        return $this->hasMany(UserSubscription::class)->with('program')->withCount('userProgress');
    }

    // public function splitSubscriptions() {
    //     return $this->hasMany(UserSplitSubscription::class)->with('split')->withCount(array('userSplitProgress' => function($query) {
    //         $query->where('date', date('Y-m-d'));
    //     }));
    // }

    public function splitSubscriptions() {
        return $this->hasMany(UserSplitSubscription::class)->with('split')->withCount('userSplitProgress');
    }

    public function usersPlan() {
        return $this->hasOne(UsersPlan::class, 'user_id', 'id');
    }

    public function userPlaylist() {
        return $this->hasMany(UserPlaylist::class);
    }
}
