<?php

namespace App;
use App\Exercises;
use App\Workouts;
use App\Programs;
use App\Splits;

use Illuminate\Database\Eloquent\Model;

class Equipments extends Model
{
    protected $guarded = [];
    protected $hidden = ['pivot'];

    public function exercises() {
        return $this->belongsToMany(Exercises::class, 'equipment_exercise', 'equipment_id', 'exercise_id')->withTimestamps();
    }

    public function workouts() {
        return $this->belongsToMany(Workouts::class, 'exercise_workout', 'equipment_id', 'workout_id')->withTimestamps();
    }

    public function programs() {
        return $this->belongsToMany(Programs::class, 'equipment_program', 'equipment_id', 'program_id')->withTimestamps();
    }

    public function splits() {
        return $this->belongsToMany(Splits::class, 'equipment_split', 'equipment_id', 'split_id')->withTimestamps();
    }
}
