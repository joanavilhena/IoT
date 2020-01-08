<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Hub extends Model
{
    protected $fillable = [
        'user_id',
        'token_hub'
    ];

}
