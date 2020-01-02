<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Solution extends Model
{
    protected $fillable = [
        'vip',
        'token',
        'state',
        'sensor_number',
        'created_at',
        'updated_at',
    ];

    /**
     * Get the comments for the blog post.
     */
    public function sensor_data()
    {
        return $this->hasMany('App\SensorData');
    }
}
