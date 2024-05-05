<?php

namespace App\Models\Hooks\Api;

use App\Helpers\CustomHelper;
use App\Models\ShotListUserPin;
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
            $query->selectRaw('IF(sup.id IS NOT NULL,1,0) AS is_user_pin');
            $query->leftJoin('shotlist_user_pin AS sup', function ($leftJoin) use ($request) {
                $leftJoin->on('sup.shot_list_id', '=', 'shot_list.id');
                if (isset($request['user']) && is_object($request['user']) && isset($request['user']->id)) {
                    $leftJoin->where('sup.user_id', $request['user']->id);
                }
            });
            if( !empty($request['keyword']) ){
                $keyword = $request['keyword'];
                $query->where(function($where) use ($keyword){
                    $where->orWhere('shot_list.name','like',"%$keyword%");
                    $where->orWhere('shot_list.description','like',"%$keyword%");
                });
            }
            if( !empty($request['type']) && $request['type'] == 'share'){
                $query->selectRaw('IF(ums.is_edit = 1,1,0) AS is_edit');
                $query->join('user_member_shotlist AS ums','ums.shot_list_id','=','shot_list.id');
                $query->where('ums.target_id',$request['user']->id);
                $query->whereNull('ums.deleted_at');
            } else {
                if (isset($request['user']) && is_object($request['user']) && !is_null($request['user']->id)) {
                    $query->where('shot_list.user_id',$request['user']->id);
                }
            }

            $query->orderByRaw("is_user_pin DESC, ID DESC");
            $query->groupBy('shot_list.id');
        }

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
        // $postdata['user_id'] = $request['user']->id;
        if (isset($request['user']) && is_object($request['user']) && isset($request['user']->id)) {
            $postdata['user_id'] = $request['user']->id;
        }
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
        if( isset($request['is_pin']) ){
            $shotList = $this->_model->where('slug',$slug)->first();
            if( isset($shotList->id) ){
                if( $request['is_pin'] == 0 ){
                    ShotListUserPin::where('user_id',$request['user']->id)
                                    ->where('shot_list_id',$shotList->id)
                                    ->forceDelete();
                } else {
                    ShotListUserPin::insert([
                        'user_id'      => $request['user']->id,
                        'shot_list_id' => $shotList->id
                    ]);
                }
            }
        }
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
