<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class Scene extends JsonResource
{
    private $_index_no;

    function __construct($resource,$index_no=1)
    {
        parent::__construct($resource);
        $this->_index_no = $index_no;
    }
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
           'type'                   => $this->type,
           'shot_list_id'           => $this->shot_list_id,
           'shot_list'              => new ShotList($this->whenLoaded('shotList')),
           'size'                   => $this->size,
           'title'                  => $this->title,
           'date'                   => $this->date,
           'time'                   => $this->time,
           'sub_heading'            => $this->sub_heading,
           'slug'                   => $this->slug,
           'image_url'              => !empty($this->image_url) ? Storage::url($this->image_url) : NULL,
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
           'schedule_sort_order' => $this->shoot_sort_order,
           'scene_no'    => $this->scene_no,
           'is_schedule' => $this->is_schedule,
           'created_at'  => $this->created_at,
           'index_no'    => $this->_index_no,
       ];
    }
}
