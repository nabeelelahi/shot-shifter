<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\UserMemberShotList;

class UserMemberShotListController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('UserMemberShotList');
        $this->__request     = $request;
        $this->__apiResource = 'UserMemberShotList';
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
            case 'INDEX':
                $validator = Validator::make($this->__request->all(), [
                    'shot_list_id' => 'required',
                ]);
            break;
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'shot_list_id' => [
                        'required',
                        Rule::exists('shot_list','id')
                            ->where('user_id',$this->__request['user']->id)
                            ->whereNull('deleted_at'),
                    ],
                    'target_id'     => [
                        'required',
                        //Rule::exists('users','id')->whereNull('deleted_at'),
                    ],
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    'attribute'     => 'required',
                ]);
            break;
            case 'DELETE':
                $this->__request->merge(['slug'=>$slug]);
                $validator = Validator::make($this->__request->all(), [
                    'slug' => [
                        'required',
                        Rule::exists('user_member_shotlist','slug')
                            ->where('actor_id',$this->__request['user']->id)
                            ->whereNull('deleted_at'),
                    ],
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
        // $checkUserMember = UserMemberShotList::checkUserMember($request['shot_list_id'],$request['target_id']);
        // if( $checkUserMember ){
        //     $this->__is_error = true;
        //     return $this->__sendError('Validation Message',['message' => 'Selected user has already been added'], 400);
        // }
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

    public function store()
    {
        $request = $this->__request;
        $param_rule['shot_list_id'] = 'required';
        $param_rule['target_id']    = 'required';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $record = UserMemberShotList::addMembers($request->all());

        $this->__is_paginate = false;

        return $this->__sendResponse($record, 200, __('app.success_listing_message'));
    }
}
