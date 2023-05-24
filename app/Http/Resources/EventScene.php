<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class EventScene extends JsonResource
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
            'id'         => $this->id,
            'user_id'    => $this->user_id,
            'slug'       => $this->slug,
            'title'      => $this->title,
            'date'       => $this->date,
            'created_at' => $this->created_at,
            'scenes'     => Scene::collection($this->whenLoaded('scenes')),
       ];
    }
}
