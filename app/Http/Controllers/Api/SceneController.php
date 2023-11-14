<?php
namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\Scene;
use App\Models\ShotList;
use App\Http\Resources\Scene AS SceneResource;

class SceneController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Scene');
        $this->__request     = $request;
        $this->__apiResource = 'Scene';
    }

    /**
     * This function is used for validate restfull request
     * @param $action
     * @param string $slug
     * @return array
     */
    public function validation($action,$slug=0)
    {
        $validator = [];
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'shot_list_id' => 'required|numeric',
                    'type'         => 'required|in:day,scene,event',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    'shot_list_id' => 'required|exists:shot_list,id',
                    'type'         => 'required|in:day,scene,event',
                ]);
                break;
            case 'INDEX':
                $validator = Validator::make($this->__request->all(), [
                    'shot_list_id' => 'required|exists:shot_list,id',
                    'mode'         => 'required|in:story,schedule',
                ]);
                break;
        }
        return $validator;
    }

    /**
     * @param $request
     */
    public function beforeIndexLoadModel($request)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterIndexLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     */
    public function beforeStoreLoadModel($request)
    {
        $checkShotList = ShotList::getShotListByID($request['shot_list_id']);
        if( !isset($checkShotList->id) ){
            $this->__is_error = true;
            return $this->__sendError('Validation Message',[ 'message' => 'Shot list id is not valid' ],400);
        }
        if( $request['type'] == 'scene' ){
            if( $checkShotList->is_lock ){
                $this->__is_error = true;
                $message = 'You are not be able to add a scene because shot list has been locked';
                return $this->__sendError('Validation Message',[ 'message' => $message ],400);
            }
        }
    }

    /**
     * @param $request
     * @param $record
     */
    public function afterStoreLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeShowLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterShowLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeUpdateLoadModel($request,$slug)
    {
        $checkShotList = ShotList::getShotListByID($request['shot_list_id']);
        if( !isset($checkShotList->id) ){
            $this->__is_error = true;
            return $this->__sendError('Validation Message',[ 'message' => 'Shot list id is not valid' ],400);
        }
        if( $request['type'] == 'scene' ){
            if( $checkShotList->is_lock ){
                $this->__is_error = true;
                $message = 'You are not be able to add a scene because shot list has been locked';
                return $this->__sendError('Validation Message',[ 'message' => $message ],400);
            }
        }
    }

    /**
     * @param $request
     * @param $record
     */
    public function afterUpdateLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeDestroyLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {
        $record = \DB::table('scenes')->where('slug',$slug)->first();
        return Scene::getAllScenes(['shot_list_id' => $record->shot_list_id]);
    }

    public function sceneComplete()
    {
        $request = $this->__request;
        $param_rule['shot_list_id'] = 'required';
        $param_rule['scene_id']     = 'required|exists:scenes,id,is_complete,0';
        $param_rule['type']         = 'required|in:scene,day,event';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        Scene::markAsComplete($request->all());

        $records = Scene::with(['shotList'])
                        ->where('shot_list_id',$request['shot_list_id'])
                        ->orderBy('shoot_sort_order','asc')
                        ->take(1000)
                        ->get();

        $unschedule_records[] = [
            'id'    => 0,
            "shot_list_id" => 1,
            'type'  => 'day',
            'title' => 'unschedule'
        ];
        $schedule_record = [];
        $final_data = [];
        if( count($records) ){
            foreach( $records as $record ){
                if( $record->is_schedule == 1 ){
                    $schedule_record[] = new SceneResource($record);
                } else {
                    $unschedule_records[] = new SceneResource($record);
                }
            }
            if( count($unschedule_records) > 1 ){
                $final_data = [...$schedule_record,...$unschedule_records];
            } else {
                $final_data = $schedule_record;
            }
        } else {
            $final_data = $records;
        }

        $this->__is_paginate = false;
        $this->__collection = false;
        return $this->__sendResponse($final_data,200,__('app.success_listing_message'));
    }

    /*
    public function reOrderRecord()
    {
        $request = $this->__request;
        $param_rule['old_event_id']   = 'required|numeric';
        $param_rule['new_event_id']   = 'required|numeric';
        $param_rule['shot_list_id']   = 'required|numeric';
        $param_rule['scene_id']       = 'required|numeric';
        $param_rule['old_sort_order'] = 'required|numeric';
        $param_rule['new_sort_order'] = 'required|numeric';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $records = Scene::reOrderRecords($request->all(),$request);

        $this->__is_paginate = false;
        $this->__collection  = false;
        return $this->__sendResponse($records,200,__('app.success_listing_message'));
    }
    */

    public function reOrderRecord()
    {
        $request   = $this->__request;
        $json_data = $request->all();
        if( count($json_data) ){
            $sort_order = 1;
            foreach($json_data as $scene){
                if( $scene['title'] == 'unschedule' ){
                    break;
                }
                $data[] = [
                    'id' => $scene['id'],
                    'shoot_sort_order' => $sort_order,
                    'is_schedule' => '1'
                ];
                $sort_order++;
            }
            Scene::upsert($data,['id'],['shoot_sort_order','is_schedule']);
        }

        $records = Scene::with(['shotList'])
                        ->where('shot_list_id',$json_data[0]['shot_list_id'])
                        ->orderBy('shoot_sort_order','asc')
                        ->take(1000)->get();

        $unschedule_records[] = [
            'id'    => 0,
            "shot_list_id" => 1,
            'type'  => 'day',
            'title' => 'unschedule'
        ];
        $schedule_record = [];
        $final_data = [];
        if( count($records) ){
            foreach( $records as $record ){
                if( $record->is_schedule == 1 ){
                    $schedule_record[] = new SceneResource($record);
                } else {
                    $unschedule_records[] = new SceneResource($record);
                }
            }
            if( count($unschedule_records) > 1 ){
                $final_data = [...$schedule_record,...$unschedule_records];
            } else {
                $final_data = $schedule_record;
            }
        } else {
            $final_data = $records;
        }

        $this->__is_paginate = false;
        $this->__collection = false;
        return $this->__sendResponse($final_data,200,__('app.success_listing_message'));
    }

    public function index()
    {
        $request = $this->__request;
        $param_rule['mode']         = 'required|in:story,schedule';
        $param_rule['shot_list_id'] = 'required|exists:shot_list,id';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $query = Scene::with(['shotList'])
                    ->where('shot_list_id',$request['shot_list_id']);

        if( !empty($request['keyword']) ){
            $keyword = $request['keyword'];
            $query->where( function($where) use ($keyword){
                $where->orWhere('title','like',"%$keyword%");
                $where->orWhere('description','like',"%$keyword%");
            });
        }

        if( !empty($request['mode']) )
        {
            if( $request['mode'] == 'story' ){
                $query->where('type','scene');
                $query->orderBy('scene_no','asc');
            }
            if( $request['mode'] == 'schedule' ){
                $query->orderBy('shoot_sort_order','asc');
            }
        }
        $records = $query->take(1000)->get();
        $unschedule_records[] = [
            'id'    => 0,
            "shot_list_id" => 1,
            'type'  => 'day',
            'title' => 'unschedule'
        ];
        $schedule_record = [];
        $final_data = [];
        if( count($records) && $request['mode'] == 'schedule' ){
            foreach( $records as $record ){
                if( $record->is_schedule == 1 ){
                    $schedule_record[] = new SceneResource($record);
                } else {
                    $unschedule_records[] = new SceneResource($record);
                }
            }
            if( count($unschedule_records) > 1 ){
                $final_data = [...$schedule_record,...$unschedule_records];
            } else {
                $final_data = $schedule_record;
            }
        } else {
            $final_data = $records;
        }

        $this->__is_paginate = false;
        $this->__collection = false;
        return $this->__sendResponse($final_data,200,__('app.success_listing_message'));
    }

    /*
    public function index()
    {
        $request = $this->__request ;
        $unschedule = !empty($request['is_unschedule']) ? 1 : 0;

        if( $unschedule == 1 ){
            $records = Scene::getAllScenes($request->all());
        } else {
            $records = Scene::getEventScenes($request);
        }

        $this->__is_paginate = false;
        $this->__collection  = false;
        return $this->__sendResponse($records,200,'Scenes retrieved successfully');
    }

    public function show($slug)
    {
        $request = $this->__request;
        $record = Scene::getEventScenes($request,$slug);
        if( count($record) ){
            $record = $record[0];
        }

        $this->__is_paginate = false;
        $this->__collection  = false;

        return $this->__sendResponse($record,200,'Scene retrieved successfully');
    }

    public function store()
    {
        $request = $this->__request;
        $param_rules['shot_list_id'] = 'required';

        $response = $this->__validateRequestParams($request->all(),$param_rules);

        if( $this->__is_error )
            return $response;

        $record = Scene::createScene($request,$this->loadModel()->fill($request->all()));

        $this->__is_paginate   = false;
        $this->__is_collection = false;

        return $this->__sendResponse($record,200,'Scene created successfully');
    }

    public function update($slug)
    {
        $request = $this->__request;
        $param_rules['event_id']     = 'required';
        $param_rules['shot_list_id'] = 'required';

        $response = $this->__validateRequestParams($request->all(),$param_rules);

        if( $this->__is_error )
            return $response;

        $record = Scene::updateScene($request,$this->loadModel()->fill($request->all()),$slug);

        $this->__is_paginate   = false;
        $this->__is_collection = false;

        return $this->__sendResponse($record,200,'Scene updated successfully');
    }

    public function destroy($slug)
    {
        $request = $this->__request;
        $param_rules['event_id']     = 'required';
        $param_rules['shot_list_id'] = 'required';

        $response = $this->__validateRequestParams($request->all(),$param_rules);

        if( $this->__is_error )
            return $response;

        //delete scene
        Scene::where('slug',$slug)->delete();

        //get all event scenes
        $records = Scene::getEventScenes($request);

        $this->__is_paginate = false;
        $this->__collection  = false;
        return $this->__sendResponse($records,200,'Scene deleted successfully');
    }
    */
}
