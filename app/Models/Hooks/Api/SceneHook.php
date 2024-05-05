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
        $query->with(['shotList']);

        if( !empty($request['shot_list_id']) )
            $query->where('shot_list_id',$request['shot_list_id']);

        if( !empty($request['keyword']) ){
            $keyword = $request['keyword'];
            $query->where( function($where) use ($keyword){
                $where->orWhere('title','like',"%$keyword%");
                $where->orWhere('description','like',"%$keyword%");
            });
        }
        if( isset($request['is_schedule']) ){
            $query->where('is_schedule',$request['is_schedule']);
        }

        if( !empty($request['mode']) ){
            if( $request['mode'] == 'story' ){
                $query->orderBy('sort_order','asc');
            } else {
                $query->orderBy('shoot_sort_order','asc');
            }
        } else {
            $query->orderBy('sort_order','asc');
        }
        //set default pagination limit
        $request['limit'] = 1000;
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
        $scene_no = 0;
        $getSortorder = $this->_model::getMaxSortOrder($request['shot_list_id']);
        if( !empty($postdata['image_url']) ){
            if( $request->hasFile('image_url') ){
                $postdata['image_url'] = CustomHelper::uploadMedia('scene',$postdata['image_url']);
            } else {
                $file_path = public_path('storage/scene/'.basename($postdata['image_url']));
                $postdata['image_url'] = CustomHelper::uploadMediaByPath('scene',$file_path);
            }
        }
        if( $request['type'] == 'scene' ){
            if( empty($getSortorder->total_scene) ){
                $scene_no = ($getSortorder->total_scene + 1);
            } else {
                $data     = json_decode(file_get_contents(public_path($request->shot_list_id . '_scene_no.json')),true);
                $scene_no = ($data['last_scene_no'] + 1);
            }
        }

        $postdata['scene_no']    = $scene_no;
        $postdata['is_schedule'] = $request['type'] == 'scene' ? '0' : '1';
        $postdata['sort_order']  = $request['type'] == 'scene' ? ($getSortorder->sort_order + 1) : 0;
        $postdata['shoot_sort_order'] = $request['type'] != 'scene' ? ($getSortorder->shoot_sort_order + 1) : 0;
        // $postdata['user_id']    = $request['user']->id;
        if (isset($request['user']) && is_object($request['user']) && isset($request['user']->id)) {
            $postdata['user_id'] = $request['user']->id;
        }
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
        $scene_data = [];
        if( $request['type'] == 'scene' ){
            \DB::table('shot_list')->where('id',$record->shot_list_id)->increment('total_scene',1);
            $data = [
                'last_scene_no' => $record->scene_no
            ];
            file_put_contents(public_path($record->shot_list_id . '_scene_no.json'),json_encode($data));
        }

        if( !empty($request['new_sort_order']) ){
            array_push($scene_data,[
                'id'         => $record->id,
                'sort_order' => $request['new_sort_order'],
            ]);
            $getScenes = $this->getScenesBySortOrder($request['shot_list_id'],$request['new_sort_order']);
            if( count($getScenes) ) {
                foreach($getScenes as $scene){
                    if( $scene->id != $record->id ){
                        array_push($scene_data,[
                            'id' => $scene->id,
                            'sort_order' => ($scene->sort_order + 1),
                        ]);
                    }

                }
            }
            $this->_model::upsert($scene_data,['id'],['sort_order']);
        }
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
        // if( count($records) ){
        //     foreach( $records as $record ){
        //         \DB::table('shot_list')->where('id',$record->shot_list_id)->decrement('total_scene', 1);
        //         $scenes = $this->_model->where('id','>',$record->id)->get();
        //         if( count($scenes) ){
        //             $scene_no = $record->scene_no;
        //             $cases = [];
        //             $data  = [];
        //             $ids   = [];
        //             foreach( $scenes as $scene ){
        //                 $cases[]  = "WHEN {$scene->id} then ?";
        //                 $data[]   = $scene_no;
        //                 $ids[]    = $scene->id;
        //                 $scene_no++;
        //             }
        //             $ids = implode(',', $ids);
        //             $cases = implode(' ', $cases);
        //             \DB::update("UPDATE scenes SET `scene_no` = CASE `id` {$cases} END WHERE `id` in ({$ids})", $data);
        //         }
        //     }
        // }
    }

    public function getScenesBySortOrder($shot_list_id,$sort_order)
    {
        $query = $this->_model::where('shot_list_id',$shot_list_id)
                                ->where('sort_order','>=',$sort_order)
                                ->get();
        return $query;
    }

    public function create_cache_signature($request)
    {
        $cache_params = $request->except(['user','api_token']);
        return 'SceneHook' . md5(implode('',$cache_params));
    }
}
