<?php

namespace App;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Plans extends Model
{
    protected $guarded = [];

    public function users() {
        return $this->belongsToMany(User::class, 'plan_user', 'plan_id', 'user_id')->withPivot('plan_start', 'plan_end')->withTimestamps();
    }
}
