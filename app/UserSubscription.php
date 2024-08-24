<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\User;
use App\Programs;
use App\UserProgress;

class UserSubscription extends Model
{
    protected $guarded = [];

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function program() {
        return $this->belongsTo(Programs::class)->withCount('workouts');
    }

    public function userProgress() {
        return $this->hasMany(UserProgress::class, 'subscription_id', 'id');
    }
}
