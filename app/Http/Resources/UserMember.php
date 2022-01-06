<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserMember extends JsonResource
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
           'member'     => new PublicUser($this->whenLoaded('member')),
           'created_at' => $this->created_at,
       ];
    }
}
