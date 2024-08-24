<?php

namespace App;
use App\Exercises;
use App\Equipments;
use App\ExerciseWorkout;
use DB;

use Illuminate\Database\Eloquent\Model;

class Workouts extends Model
{
    protected $guarded = [];
    protected $hidden = ['pivot'];

    public function getRouteKeyName(){
        return 'code';
    }

    public function exercises() {
        return $this->belongsToMany(Exercises::class, 'exercise_workout', 'workout_id', 'exercise_id')->withPivot('id','variation_name', 'category_id', 'duration', 'sets', 'based_on', 'ex_duration', 'ex_reps', 'rest_duration')->withTimestamps();
    }

    public function exWk() {
        return $this->hasMany(ExerciseWorkout::class, 'workout_id', 'id')->select(['duration', 'workout_id'])->groupBy('duration');
    }

    public function equipments() {
        return $this->belongsToMany(Equipments::class, 'equipment_workouts', 'workout_id', 'equipment_id')->withTimestamps();
    }

    public function warmups() {
        return $this->belongsToMany(Exercises::class, 'warmup_workout', 'workout_id', 'exercise_id')->withTimestamps();
    }

    public function poststreches() {
        return $this->belongsToMany(Exercises::class, 'poststrech_workout', 'workout_id', 'exercise_id')->withTimestamps();
    }

    // public function workoutVariations() {
    //     $variations = DB::select()
    // }
}
