<?php
namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\Scene;
use App\Models\ShotList;

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
                    'shot_list_id' => 'required',
                    'image_url'    => 'image|max:10240',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    'shot_list_id' => 'required|exists:shot_list,id',
                    'image_url' => 'image|max:10240',
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
        if( $checkShotList->is_lock ){
            $this->__is_error = true;
            $message = 'You are not be able to add a scene because shot list has been locked';
            return $this->__sendError('Validation Message',[ 'message' => $message ],400);
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
        if( $checkShotList->is_lock ){
            $this->__is_error = true;
            $message = 'You are not be able to add a scene because shot list has been locked';
            return $this->__sendError('Validation Message',[ 'message' => $message ],400);
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

    public function sceneComplete()
    {
        $request = $this->__request;
        $param_rule['scene_id'] = 'required|exists:scenes,id,is_complete,0';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $record = Scene::markAsComplete($request->all());

        $this->__is_collection = false;
        $this->__is_paginate   = false;

        return $this->__sendResponse($record,200,__('app.success_listing_message'));
    }

    public function reOrderRecord()
    {
        $request = $this->__request;
        $param_rule['shot_list_id']   = 'required|numeric';
        $param_rule['scene_id']       = 'required|numeric';
        $param_rule['old_sort_order'] = 'required|numeric';
        $param_rule['new_sort_order'] = 'required|numeric';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $records = Scene::reOrderRecords($request->all());

        $this->__is_paginate   = false;
        return $this->__sendResponse($records,200,__('app.success_listing_message'));
    }
}
