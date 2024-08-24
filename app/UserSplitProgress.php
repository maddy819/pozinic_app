<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\User;
use App\Workouts;
use App\UserSplitSubscription;

class UserSplitProgress extends Model
{
    protected $guarded = [];

    public function workout() {
        return $this->belongsTo(Workouts::class);
    }

    public function UserSplitSubscription() {
        return $this->belongsTo(UserSplitSubscription::class, 'id', 'subscription_no');
    }
}
