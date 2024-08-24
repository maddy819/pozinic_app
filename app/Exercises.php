<?php

namespace App;
use App\Workouts;
use App\Category;
Use App\Equipments;
use App\ExerciseVariations;

use Illuminate\Database\Eloquent\Model;

class Exercises extends Model
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
        return $this->belongsToMany(Equipments::class, 'equipment_exercise', 'exercise_id', 'equipment_id')->withTimestamps();
    }

    public function exerciseVariation() {
        return $this->hasMany(ExerciseVariations::class, 'exercise_code', 'code');
    }

    public static function boot() {
        parent::boot();
        self::deleting(function($exercise) { 
            dd($exercise);
            $exercise->workouts()->each(function($workout) {
                $workout->delete(); // <-- direct deletion
            });
        });
    }
}
