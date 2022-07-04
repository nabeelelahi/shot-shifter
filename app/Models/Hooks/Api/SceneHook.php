<?php

namespace App\Models\Hooks\Api;

use App\Helpers\CustomHelper;
use Carbon\Carbon;

class SceneHook
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
        $query->with(['shotList','breaks']);

        if( !empty($request['shot_list_id']) )
            $query->where('shot_list_id',$request['shot_list_id']);

        if( !empty($request['keyword']) ){
            $keyword = $request['keyword'];
            $query->where( function($where) use ($keyword){
                $where->orWhere('title','like',"%$keyword%");
                $where->orWhere('description','like',"%$keyword%");
            });
        }
        if( !empty($request['mode']) ){
            if( $request['mode'] == 'watch ' ){
                $query->orderBy('sort_order','asc');
            } else {
                $query->orderBy('shoot_sort_order','asc');
            }
        } else {
            $query->orderBy('sort_order','asc');
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
        $getSortorder = $this->_model::getMaxSortOrder($request['shot_list_id']);
        if( !empty($postdata['image_url']) ){
            $postdata['image_url'] = CustomHelper::uploadMedia('scene',$postdata['image_url']);
        }
        $postdata['scene_no']   = ($getSortorder->total_scene + 1);
        $postdata['sort_order'] = ($getSortorder->sort_order + 1);
        $postdata['user_id']    = $request['user']->id;
        $postdata['slug']       = time() . uniqid();
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
        \DB::table('shot_list')->where('id',$record->shot_list_id)->increment('total_scene',1);
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
            $postData['image_url'] = CustomHelper::uploadMedia('scene',$postData['image_url']);
        }
        $postData['updated_at'] = Carbon::now();
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
    public function hook_after_delete($request,$records)
    {
        if( count($records) ){
            foreach( $records as $record ){
                \DB::table('shot_list')->where('id',$record->shot_list_id)->decrement('total_scene', 1);
            }
        }
    }

    public function create_cache_signature($request)
    {
        $cache_params = $request->except(['user','api_token']);
        return 'SceneHook' . md5(implode('',$cache_params));
    }
}
