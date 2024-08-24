<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Item;
use App\Nutrition;

class Meal extends Model
{
    protected $guarded = [];

    public function getRouteKeyName(){
        return 'id';
    }

    public function nutrition() {
        return $this->belongsTo(Nutrition::class);
    }

    public function items() {
        return $this->hasMany(Item::class);
    }
}
