<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    protected $table = 'ed_answers';
    
    public $timestamps = false;

    protected $fillable = [
        'question_id', 'user_id', 'option_choice',
    ];
}
