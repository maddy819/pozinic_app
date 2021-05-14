<?php

namespace App;
use App\Exercises;

use Illuminate\Database\Eloquent\Model;

class Equipments extends Model
{
    protected $guarded = [];

    public function exercises() {
        return $this->belongsToMany(Exercises::class, 'exercise_workout', 'equipment_id', 'exercise_id')->withTimestamps();
    }
}
