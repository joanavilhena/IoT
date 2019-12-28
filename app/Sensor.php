<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Sensor extends Model
{
  protected $fillable = [
      'vip',
      'state',
      'name',
      'ip',
      'minVal',
      'maxVal',
      //'lastUpdate',
      'value',
      'created_at',
      'updated_at',
  ];


}
