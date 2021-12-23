<?php

namespace App\Models\Hooks\Api;

use App\Helpers\CustomHelper;
use Carbon\Carbon;

class ShotListHook
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
        $query->with(['user','member']);
        $query->select('shot_list.*');
        if( $slug == NULL )
        {
            if( !empty($request['keyword']) ){
                $keyword = $request['keyword'];
                $query->where(function($where) use ($keyword){
                    $where->orWhere('shot_list.name','like',"%$keyword%");
                    $where->orWhere('shot_list.description','like',"%$keyword%");
                });
            }
            if( !empty($request['type']) && $request['type'] == 'share'){
                $query->join('user_member_shotlist AS ums','ums.shot_list_id','=','shot_list.id');
                $query->where('ums.target_id',$request['user']->id);
            } else {
                $query->where('shot_list.user_id',$request['user']->id);
            }
        }
        $query->orderByRaw("is_pin DESC, ID DESC");
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before add data is execute
    | ----------------------------------------------------------------------
    | @arr
    |
    */
    public function hook_before_add($request,&$postdata)
    {
        if( !empty($postdata['image_url']) ){
            $postdata['image_url'] = CustomHelper::uploadMedia('shot_list',$postdata['image_url']);
        }
        $postdata['user_id'] = $request['user']->id;
        $postdata['slug'] = time() . uniqid();
        $postdata['created_at'] = Carbon::now();
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
        if( !empty($postData['image_url']) ){
            $postData['image_url'] = CustomHelper::uploadMedia('shot_list',$postData['image_url']);
        }
        $postdata['updated_at'] = Carbon::now();
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
        return 'ShotListHook' . md5(implode('',$cache_params));
    }
}
