<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserMemberShotList extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_member_shotlist';

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
        'shot_list_id', 'actor_id', 'target_id', 'slug', 'is_edit', 'created_at',
        'updated_at', 'deleted_at'
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

    public function actor()
    {
        return $this->belongsTo(User::class,'actor_id','id');
    }

    public function target()
    {
        return $this->belongsTo(User::class,'target_id','id');
    }

    public function shotList()
    {
        return $this->belongsTo(ShotList::class,'shot_list_id','id');
    }

    public static function checkUserMember($shot_list_id,$member_id)
    {
        $query = \DB::table('user_member_shotlist')
                      ->where('shot_list_id',$shot_list_id)
                      ->where('target_id',$member_id)
                      ->count();
        return $query;
    }

    public static function addMembers($params)
    {
        // $existing_target_ids = [];
        // $getShotListMembers  = self::where('shot_list_id',$params['shot_list_id'])->get();
        // if( count($getShotListMembers) ){
        //     foreach( $getShotListMembers as $shotListMember ){
        //         $existing_target_ids[] = $shotListMember->target_id;
        //     }
        // }
        $target_ids = $params['target_id'];
        //$target_ids = array_unique(array_merge($existing_target_ids,$target_ids));
        //delete old member data
        //self::where('shot_list_id',$params['shot_list_id'])->forceDelete();
        //add new member data
        foreach( $target_ids as $value ){
            $insert_data[] = [
                'shot_list_id' => $params['shot_list_id'],
                'actor_id'     => $params['user']->id,
                'target_id'    => $value,
                'slug'         => $value . uniqid(),
                'is_edit'      => !empty($params['is_edit'][$value]) ? $params['is_edit'][$value] : 0
            ];
        }
        self::insert($insert_data);

        return self::getShotListMembers($params['shot_list_id']);
    }

    public static function getShotListMembers($shot_list_id)
    {
        $query = self::with('actor','target','shotList')
                    ->where('shot_list_id',$shot_list_id)
                    ->get();
        return $query;
    }

    public static function getUserByMemberSlug($member_slug)
    {
        $query = \DB::table('user_member_shotlist AS ums')
                        ->select('u.*','uat.device_type','uat.device_token','ums.shot_list_id','sl.name AS shot_list_name')
                        ->join('shot_list AS sl','sl.id','=','ums.shot_list_id')
                        ->join('users AS u','u.id','=','ums.target_id')
                        ->join('user_api_token AS uat','uat.user_id','=','u.id')
                        ->where('ums.slug',$member_slug)
                        ->take(500)
                        ->get();
        return $query;
    }
}
