<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class SensorData extends Model
{
  protected $fillable = [
      'name',
      'value',
      'threshold',
      'most_recent',
      'min_value',
      'max_value',
  ];
}
