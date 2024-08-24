<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Strech extends Model
{
    protected $guarded = [];
    protected $hidden = ['pivot'];

    public function getRouteKeyName(){
        return 'code';
    }

    public function category() {
        return $this->belongsTo(Category::class);
    }

    public function workouts() {
        return $this->belongsToMany(Workouts::class, 'exercise_workout', 'exercise_id', 'workout_id')->withTimestamps();
    }

    public function equipments() {
        return $this->belongsToMany(Equipments::class, 'equipment_streches', 'strech_id', 'equipment_id')->withTimestamps();
    }
}
