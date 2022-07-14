<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Scene extends JsonResource
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
           'id'                     => $this->id,
           'shot_list_id'           => $this->shot_list_id,
           'size'                   => $this->size,
           'title'                  => $this->title,
           'slug'                   => $this->slug,
           'image_url'              => $this->image_url,
           'description'            => $this->description,
           'angle'                  => $this->angle,
           'lens'                   => $this->lens,
           'internal_external'      => $this->internal_external,
           'sun_time'               => $this->sun_time,
           'location'               => $this->location,
           'location_pin'           => $this->location_pin,
           'cast'                   => $this->cast,
           'wardrobe'               => $this->wardrobe,
           'props'                  => $this->props,
           'action'                 => $this->action,
           'speed'                  => $this->speed,
           'sound'                  => $this->sound,
           'timepicker'             => $this->timepicker,
           'grip'                   => $this->grip,
           'lines_dialogue_english' => $this->lines_dialogue_english,
           'lines_dialogue_foreign' => $this->lines_dialogue_foreign,
           'camera'      => $this->camera,
           'is_complete' => $this->is_complete,
           'sort_order'  => $this->sort_order,
           'shoot_sort_order' => $this->shoot_sort_order,
           'scene_no'    => $this->scene_no,
           'created_at'  => $this->created_at,
           'shot_list'   => new ShotList($this->whenLoaded('shotList')),
           'breaks'      => $this->whenLoaded('breaks'),
       ];
    }
}
