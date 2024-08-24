<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Exercises;

class PoststrechWorkout extends Model
{
    protected $guarded = [];

    protected $table = 'poststrech_workout';

    public function exercise() {
        return $this->hasOne(Exercises::class, 'id', 'exercise_id');
    }


}
