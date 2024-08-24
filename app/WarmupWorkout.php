<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Exercises;

class WarmupWorkout extends Model
{
    protected $guarded = [];

    protected $table = 'warmup_workout';

    public function exercise() {
        return $this->hasOne(Exercises::class, 'id', 'exercise_id');
    }


}
