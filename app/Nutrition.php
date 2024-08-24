<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Meal;
use App\Item;

class Nutrition extends Model
{
    protected $guarded = [];

    public function getRouteKeyName(){
        return 'id';
    }

    public function meals() {
        return $this->hasMany(Meal::class)->with('items');
    }

    public function items(){
        return $this->hasManyThrough(Item::class, Meal::class);
    }
}
