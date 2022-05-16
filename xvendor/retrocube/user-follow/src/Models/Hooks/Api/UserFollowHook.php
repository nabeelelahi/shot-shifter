<?php

namespace Retrocube\UserFollow\Models\Hooks\Api;

use Carbon\Carbon;

class UserFollowHook
{
    private $_model;

    public function __construct($model)
    {
        $this->_model = $model;
    }

    /*
   | ----------------------------------------------------------------------
   | Hook for manipulate query of index result
   | ----------------------------------------------------------------------
   | @query   = current sql query
   | @request = laravel http request class
   |
   */
    public function hook_query_index(&$query,$request, $slug=NULL)
    {
        //get follow request
        $query->select('users.*','user_follow.slug AS user_follow_slug');

        if( empty($request['type']) )
            $query->join('users','users.id','=','actor_id');

        if( $request['type'] == 'request' ){
            $query->join('users','users.id','=','actor_id');
            $query->where('target_id',$request['user']->id)
                  ->where('user_follow.status','0');
        }
        if( $request['type'] == 'follower' ){
            $query->selectRaw('IF( uf.status IS NOT NULL,
                                IF(uf.status = "1",1,2),
                                0) AS is_follow');
            $query->join('users','users.id','=','actor_id');
            $query->leftJoin('user_follow AS uf',function($leftJoin) use ($request){
                $leftJoin->on('uf.target_id','=','users.id')
                    ->where('uf.actor_id','=',$request['user']->id);
            });
            $query->where('user_follow.target_id',$request['user']->id)
                  ->where('user_follow.status','1');
        }
        if( $request['type'] == 'following' ){
            $query->selectRaw('1 AS is_follow');
            $query->join('users','users.id','=','target_id');
            $query->where('actor_id',$request['user']->id)
                  ->where('user_follow.status','1');
        }
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before add data is execute
    | ----------------------------------------------------------------------
    | @arr
    |
    */
    public function hook_before_add($request,&$postData)
    {
        $postData['actor_id'] = $request['user']->id;
        $postData['status']   = '0';
        $postData['slug']     = uniqid() . rand(111,999);
        $postData['created_at'] = Carbon::now();
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after add public static function called
    | ----------------------------------------------------------------------
    | @record
    |
    */
    public function hook_after_add($request,$record)
    {
        //Your code here
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before update data is execute
    | ----------------------------------------------------------------------
    | @request  = http request object
    | @postdata = input post data
    | @id       = current id
    |
    */
    public function hook_before_edit($request, $slug, &$postData)
    {

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after edit public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$slug    = $slug
    |
    */
    public function hook_after_edit($request, $slug) {
        //Your code here
        $request['type'] = 'follower';
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command before delete public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$id      = record id = int / array
    |
    */
    public function hook_before_delete($request, $slug) {
        //Your code here

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after delete public static function called
    | ----------------------------------------------------------------------
    | @$request       = Http request object
    | @records        = deleted records
    |
    */
    public function hook_after_delete($request,$records) {
        //Your code here
    }

    public function create_cache_signature($request)
    {
        $cache_params = $request->except(['user','api_token']);
        return 'UserFollowHook' . md5(implode('',$cache_params));
    }
}
