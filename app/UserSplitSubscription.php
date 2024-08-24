<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\User;
use App\Splits;
use App\UserSplitProgress;

class UserSplitSubscription extends Model
{
    protected $guarded = [];

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function split() {
        return $this->belongsTo(Splits::class)->withCount('workouts');
    }

    public function userSplitProgress() {
        return $this->hasMany(UserSplitProgress::class, 'progress_id', 'id');
    }
}
