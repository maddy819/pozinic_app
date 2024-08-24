<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Workouts;

class SplitWorkout extends Model
{
    protected $guarded = [];

    protected $table = 'split_workouts';

    public function workout() {
        return $this->hasOne(Workouts::class, 'id', 'workout_id');
    }
}
