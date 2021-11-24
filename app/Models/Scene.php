<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Scene extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'scenes';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'shot_list_id', 'size', 'title', 'slug', 'image_url', 'description', 'angle', 'lens', 'internal_external',
        'sun_time', 'location', 'location_pin', 'cast', 'wardrobe', 'props', 'action', 'speed', 'sound', 'timepicker',
        'lines_dialogue_english', 'lines_dialogue_foreign', 'camera', 'is_complete', 'sort_order', 'status',
        'created_at', 'updated_at', 'deleted_at'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * It is used to enable or disable DB cache record
     * @var bool
     */
    protected $__is_cache_record = false;

    /**
     * @var
     */
    protected $__cache_signature;

    /**
     * @var string
     */
    protected $__cache_expire_time = 1; //days

    public function shotList()
    {
        return $this->belongsTo(ShotList::class,'shot_list_id','id');
    }

}
