<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Exercises;

class ExerciseVariations extends Model
{
    protected $guarded = [];

    public function exercise() {
        return $this->hasOne(Exercises::class, 'code', 'exercise_code');
    }
}
