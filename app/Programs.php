<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
Use App\Equipments;
Use App\Workouts;
Use App\UserSubscription;

class Programs extends Model
{
    protected $guarded = [];
    //protected $hidden = ['pivot'];

    public function getRouteKeyName(){
        return 'code';
    }

    public function equipments() {
        return $this->belongsToMany(Equipments::class, 'equipment_program', 'program_id', 'equipment_id')->withTimestamps();
    }

    public function workouts() {
        return $this->belongsToMany(Workouts::class, 'program_workout', 'program_id', 'workout_id')->withPivot('id', 'duration', 'starting_day', 'ending_day', 'total_days')->withTimestamps();
    }

    public function subscriptions() {
        return $this->hasMany(UserSubscription::class, 'program_id', 'id')->with('program')->withCount('userProgress');
    }
}
