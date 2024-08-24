<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Exercises;
use App\Workouts;
use App\Programs;
use App\Splits;
use App\Strech;

class UserPlaylist extends Model
{
    protected $guarded = [];

    public function savedExercises() {
        return $this->belongsToMany(Exercises::class, 'playlist_saved', 'playlist_id', 'exercise_id')->select('exercises.id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function savedWorkouts() {
        return $this->belongsToMany(Workouts::class, 'playlist_saved', 'playlist_id', 'workout_id')->select('workouts.id', 'title', 'duration', 'focus_area', 'level', 'image', 'good_for', 'calories_burned')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function savedPrograms() {
        return $this->belongsToMany(Programs::class, 'playlist_saved', 'playlist_id', 'program_id')->select('programs.id', 'title', 'image', 'good_for', 'no_of_days', 'focus_area', 'duration', 'level')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function savedSplits() {
        return $this->belongsToMany(Splits::class, 'playlist_saved', 'playlist_id', 'split_id')->select('splits.id', 'title', 'image', 'focus_area', 'good_for', 'type', 'duration', 'level')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }

    public function savedStreches() {
        return $this->belongsToMany(Strech::class, 'playlist_saved', 'playlist_id', 'strech_id')->select('streches.id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->where('visible', 1)->with(array('equipments' => function($query) {
            $query->select('name');
        }))->withTimestamps();
    }
}
