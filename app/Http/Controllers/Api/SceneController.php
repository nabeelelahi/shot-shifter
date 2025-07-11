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
        $param_rule['json_data'] = 'required';
        $param_rule['type']      = 'required|in:story,schedule';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $json_data = $request['json_data'];
        //reorder scene
        Scene::reOrderRecords($json_data,$request['type']);

        //get updated scenes
        $records = Scene::getAllScenes($json_data[0]['shot_list_id'],$request['type']);
        //sort scene
        if( $request['type'] == 'schedule' ){
            $scenes = Scene::sortScenes($records,$request['type']);
            $this->__collection = false;
        } else {
            $scenes = $records;
        }

        $this->__is_paginate = false;
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

    public function sceneUndo()
    {
        $shot_list_id = 0;
        $mode = 'schedule';
        $request = $this->__request;

        $param_rule['shot_list_id'] = 'required';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $last_activity = Scene::getLastActivity($request['user']->id,$request['shot_list_id']);
        if( empty($last_activity->id) ){
            return $this->__sendError('Validation Message',['message' => "You don't have any request to undo"],400);
        }
        //restore deleted record
        if( $last_activity->action_name == 'scene.destroy' ){
            $scene = json_decode($last_activity->response);
            $shot_list_id = $scene->shot_list_id;
            //restore delete scene
            Scene::restoreScene($scene->id);
        }
        if( $last_activity->action_name == 'scene.completed' ){
            $scene = json_decode($last_activity->request_payload);
            $shot_list_id = $scene->shot_list_id;
            //update scene record
            Scene::where('id',$scene->scene_id)->update(['is_complete' => '0']);
        }
        if( $last_activity->action_name == 'scene.update' ){
            $scene = json_decode($last_activity->old_record,true);
            $shot_list_id = $scene['shot_list_id'];
            //update scene record
            Scene::restoreSceneUpdate($scene['id'],$scene);
        }
        if( $last_activity->action_name == 'scene.store' ){
            $scene = json_decode($last_activity->response,true);
            $shot_list_id = $scene['shot_list_id'];
            //update scene record
            Scene::where('id',$scene['id'])->delete();
        }
        //delete last activity
        Scene::deleteLastActivity($last_activity->id);
        //get updated scenes
        $records = Scene::getAllScenes($shot_list_id,$mode);
        //sort scene
        $scenes = Scene::sortScenes($records,$mode);

        $this->__is_paginate = false;
        $this->__collection = false;
        return $this->__sendResponse($scenes,200,'Record retrieved successfully');
    }

    public function sceneReset()
    {
        $request = $this->__request;
        $param_rule['shot_list_id'] = 'required';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        //reset scene
        Scene::resetScene($request['shot_list_id']);
        //get scenes
        $records = Scene::getAllScenes($request['shot_list_id'],'schedule');
        //sort scene
        $scenes = Scene::sortScenes($records,'schedule');

        $this->__is_paginate = false;
        $this->__collection = false;
        return $this->__sendResponse($scenes,200,'Records have been reset sucessfully');
    }
    public function UpdateAllScene(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'scenes.*.id' => 'required|exists:scenes,id',
            // Add validation rules for other fields if needed
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 400);
        }

        // Extract scenes data from the request
        $scenes = $request->input('scenes');

        try {
                // Update scenes in bulk
            Scene::UpdateAllScenes($scenes);
            
            // Retrieve the updated scenes after the bulk update
            $updatedScenes = Scene::whereIn('id', array_column($scenes, 'id'))->get();

            // Return the updated scenes data in the response
            return response()->json(['message' => 'Scenes updated successfully', 'data' => $updatedScenes], 200);
        } catch (\Exception $e) {
            // Handle any exceptions that occur during bulk update
            return response()->json(['message' => 'Failed to update scenes', 'error' => $e->getMessage()], 500);
        }
    }
}
