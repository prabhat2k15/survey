<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $table = 'ed_questions';

    public $timestamps = false;

    // public function quesOptions()
    // {
    //     return $this->belongsToMany('App\')
    // }
}
