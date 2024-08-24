<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Exercises;
use App\workouts;
use App\Programs;
use App\Splits;

class Category extends Model
{
    protected $fillable = ['name', 'slug', 'featured', 'description'];

    public function exercises() {
        return $this->hasMany(Exercises::class);
    }

    public function workouts() {
        return $this->hasMany(workouts::class);
    }

    public function programs() {
        return $this->hasMany(Programs::class);
    }

    public function splits() {
        return $this->hasMany(Splits::class);
    }
}
