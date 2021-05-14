<?php

namespace App;
use App\Exercises;

use Illuminate\Database\Eloquent\Model;

class Workouts extends Model
{
    protected $guarded = [];

    public function exercises() {
        return $this->belongsToMany(Exercises::class, 'exercise_workout', 'workout_id', 'exercise_id')->withTimestamps();
    }
}
