<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserMemberShotList extends JsonResource
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
           'actor_id'   => $this->actor_id,
           'target_id'  => $this->target_id,
           'created_at' => $this->created_at,
           'actor'      => new PublicUser($this->whenLoaded('actor')),
           'target'     => new PublicUser($this->whenLoaded('target')),
           'shot_list'  => new ShotList($this->whenLoaded('shotList')),
       ];
    }
}
