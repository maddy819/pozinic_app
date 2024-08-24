<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
Use App\Equipments;
Use App\Workouts;
Use App\UserSplitSubscription;

class Splits extends Model
{
    protected $guarded = [];
    protected $hidden = ['pivot'];

    public function getRouteKeyName(){
        return 'code';
    }

    public function equipments() {
        return $this->belongsToMany(Equipments::class, 'equipment_split', 'split_id', 'equipment_id')->withTimestamps();
    }

    public function workouts() {
        return $this->belongsToMany(Workouts::class, 'split_workouts', 'split_id', 'workout_id')->withPivot('id', 'duration', 'starting_day', 'ending_day', 'total_days')->withTimestamps();
    }

    public function subscriptions() {
        return $this->hasMany(UserSplitSubscription::class, 'split_id', 'id')->with('split')->withCount('userSplitProgress');
    }
}
