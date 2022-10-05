<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class ShotList extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
       if( $this->total_scene == 0 ){
         $progress = 0;
       } else {
         $progress = $this->total_completed_scene > 0 ? round( ($this->total_completed_scene * 100) / $this->total_scene) : 0;
       }

       return [
           'id'          => $this->id,
           'user_id'     => new PublicUser($this->whenLoaded('user')),
           'name'        => $this->name,
           'slug'        => $this->slug,
           'image_url'   => !empty($this->image_url) ? Storage::url($this->image_url) : NULL,
           'description' => $this->description,
           'is_lock'     => $this->is_lock,
           'schedule_lock' => $this->schedule_lock,
           'is_pin'      => !empty($this->is_user_pin) ? 1 : 0,
           'sort_order'  => $this->sort_order,
           'status'      => $this->status,
           'progress'    => $progress,
           'is_edit'     => !empty($this->is_edit) ? 1 : 0,
           'members'     => PublicUser::collection($this->whenLoaded('member')),
           'created_at'  => $this->created_at,
       ];
    }
}
