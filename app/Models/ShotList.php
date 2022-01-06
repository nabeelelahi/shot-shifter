<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ShotList extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'shot_list';

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
        'user_id', 'name', 'slug', 'image_url', 'description', 'is_lock', 'is_pin', 'sort_order', 'status',
        'total_scene', 'total_completed_scene', 'created_at', 'updated_at', 'deleted_at'
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

    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id')
                    ->select('id','name','slug','image_url');
    }

    public function scenes()
    {
        return $this->hasMany(Scene::class,'shot_list_id','id');
    }

    public function member()
    {
        return $this->hasMany(UserMemberShotList::class,'shot_list_id','id')
                    ->select('user_member_shotlist.shot_list_id')
                    ->selectRaw("u.id, u.name, u.slug, u.image_url")
                    ->join('users AS u','u.id','=','user_member_shotlist.target_id')
                    ->groupBy('u.id');
    }

    public static function getShotListByID($id)
    {
        return self::where('id',$id)->first();
    }

    public static function exportShotList($params)
    {
        $query = self::with('scenes.breaks','member')
                    ->where('id',$params['shot_list_id'])
                    ->first();
        return $query;
    }
}
