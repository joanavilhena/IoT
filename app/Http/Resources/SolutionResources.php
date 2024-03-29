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
            'water_percentage' => $this->water_percentage,
            'token' => $this->token,
            'token_hub' => $this->token_hub,
            'fan_force' => $this->fan_force,
            'water_force' => $this->water_force,
            'sensor_number' => $this->sensor_number,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
