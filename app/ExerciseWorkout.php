<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Exercises;
use App\Workouts;

class ExerciseWorkout extends Model
{
    protected $guarded = [];

    protected $table = 'exercise_workout';

    public function exercise() {
        return $this->hasOne(Exercises::class, 'id', 'exercise_id');
    }

    public function workout() {
        return $this->hasOne(Workouts::class, 'id', 'workout_id');
    }


}
