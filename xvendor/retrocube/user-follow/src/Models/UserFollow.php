<?php

namespace Retrocube\UserFollow\Models;

use App\Models\CRUDGenerator;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserFollow extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_follow';

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
        'actor_id', 'target_id', 'slug', 'status', 'created_at', 'updated_at', 'deleted_at'
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

    public function __construct(array $attributes = array())
    {
        parent::__construct($attributes);
        $this->__api_hook_path = 'Retrocube\UserFollow\Models\Hooks\Api\\';
    }

    public static function checkFollowRequest($actor_id,$target_id)
    {
        $query = self::where('actor_id',$actor_id)
                    ->where('target_id',$target_id)
                    ->first();
        return $query;
    }
}
