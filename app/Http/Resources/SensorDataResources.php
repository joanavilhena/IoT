<?php

namespace App\Http\Resources;

//use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Resources\Json\JsonResource;

class SensorDataResources extends JsonResource
{
   /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'value' => $this->value,
            'threshold' => $this->threshold,
            'min_value' => $this->min_value,
            'max_value' => $this->max_value,
            'most_recent' => $this->most_recent,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
