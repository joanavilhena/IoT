<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SolutionResources extends JsonResource
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
            'sensor_data' =>  $this->sensor_data ,
            'vip' => $this->vip,
            'terra' => $this->terra,
            'token' => $this->token,
            'fan_force' => $this->fan_force,
            'water_force' => $this->whater_force,
            'sensor_number' => $this->sensor_number,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
