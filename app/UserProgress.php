<?php

namespace App;
use App\User;
use App\Workouts;
use App\UserSubscription;

use Illuminate\Database\Eloquent\Model;

class UserProgress extends Model
{
    protected $guarded = [];

    public function workout() {
        return $this->belongsTo(Workouts::class);
    }

    public function userSubscription() {
        return $this->belongsTo(UserSubscription::class, 'id', 'subscription_id');
    }
}
