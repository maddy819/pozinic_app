<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Answers;

class Questions extends Model
{
    protected $guarded = [];

    public function answers() {
        return $this->hasMany(Answers::class, 'question_id', 'id');
    }
}
