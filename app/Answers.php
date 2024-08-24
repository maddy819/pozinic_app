<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Questions;

class Answers extends Model
{
    protected $guarded = [];
    public $table = "answers";

    public function questions() {
        return $this->belongsTo(Questions::class, 'id', 'question_id');
    }
}
