<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Workouts;

class ProgramWorkout extends Model
{
    protected $guarded = [];

    protected $table = 'program_workout';

    public function workout() {
        return $this->hasOne(Workouts::class, 'id', 'workout_id');
    }


}
