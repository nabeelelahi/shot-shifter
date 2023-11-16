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

    }

    public function index()
    {
        $request = $this->__request;
        $param_rule['mode']         = 'required|in:story,schedule';
        $param_rule['shot_list_id'] = 'required|exists:shot_list,id';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $keyword = !empty($request['keyword']) ? $request['keyword'] : NULL;
        $records = Scene::getAllScenes($request['shot_list_id'],$request['mode'],$keyword);

        $scenes = Scene::sortScenes($records,$request['mode']);

        $this->__is_paginate = false;
        $this->__collection = false;
        return $this->__sendResponse($scenes,200,__('app.success_listing_message'));
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

        //scene mark as complete
        Scene::markAsComplete($request->all());
        //get updated scenes
        $records = Scene::getAllScenes($request['shot_list_id'],'schedule');
        //sort scene
        $scenes = Scene::sortScenes($records,'schedule');

        $this->__is_paginate = false;
        $this->__collection = false;
        return $this->__sendResponse($scenes,200,__('app.success_listing_message'));
    }

    public function reOrderRecord()
    {
        $request   = $this->__request;
        $json_data = $request->all();
        //reorder scene
        Scene::reOrderRecords($json_data);

        //get updated scenes
        $records = Scene::getAllScenes($json_data[0]['shot_list_id'],'schedule');
        //sort scene
        $scenes = Scene::sortScenes($records,'schedule');

        $this->__is_paginate = false;
        $this->__collection = false;
        return $this->__sendResponse($scenes,200,__('app.success_listing_message'));
    }

    public function destroy($slug)
    {
        $request = $this->__request;
        $request->merge(['slug' => $slug]);
        $param_rule['slug'] = [
            Rule::exists('scenes','slug')->whereNull('deleted_at')
        ];
        $param_rule['shot_list_id'] = 'required';
        $param_rule['mode']         = 'required|in:story,schedule';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        //delete scene
        Scene::where('shot_list_id',$request['shot_list_id'])
            ->where('slug',$slug)
            ->delete();

        //get updated scenes
        $records = Scene::getAllScenes($request['shot_list_id'],$request['mode']);
        //sort scene
        $scenes = Scene::sortScenes($records,$request['mode']);

        $this->__is_paginate = false;
        $this->__collection = false;
        return $this->__sendResponse($scenes,200,$this->__success_delete_message);
    }
}
