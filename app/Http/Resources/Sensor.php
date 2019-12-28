<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Sensor extends JsonResource
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
           'state' => $this->state,
           'vip' => $this->vip,
           'name' => $this->name,
           'ip' => $this->ip,
           'minVal' => $this->minVal,
           'maxVal' => $this->maxVal,
           'lastUpdate'=> $this->lastUpdate,
           'value'=> $this->value
         ];
     }
}