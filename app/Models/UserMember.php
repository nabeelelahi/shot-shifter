<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserMember extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_member';

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
        'actor_id', 'target_id', 'created_at', 'updated_at', 'deleted_at'
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

    public function member()
    {
        return $this->belongsTo(User::class,'target_id','id');
    }

    public static function getMyContacts($mobile_no)
    {
        foreach( $mobile_no as $mb ){
            $mb_data[] = str_replace(['+',' ','-','(',')'],'',$mb);
        }
        $mb_data = implode(',', $mb_data);
        $users = User::whereRaw("REPLACE(REPLACE(mobile_no,'+',''),'-','') IN ($mb_data) ")
                    ->get();
        return $users;
    }

    public static function deleteMember($actor_id)
    {
        self::where('actor_id',$actor_id)->forceDelete();
        return true;
    }

    public static function addMembers($params)
    {
        //delete old team member
        self::deleteMember($params['user']->id);
        //add new members
        $members = self::getMyContacts($params['mobile_no']);
        if( count($members) ){
            foreach($members as $member){
                $data[] = [
                    'actor_id'   => $params['user']->id,
                    'target_id'  => $member->id,
                    'created_at' => Carbon::now()
                ];
            }
            self::insert($data);
        }
        return $members;
    }
}
