<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Models\Notification;
use App\Models\ShotList;
use App\Models\User;
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
        $target_users = UserMemberShotList::getUserByMemberSlug($slug);
        if( count( $target_users) ){
            $android_users = [];
            $ios_users = [];
            foreach( $target_users as $target_user ){
                if( $target_user->device_type == 'android' ){
                    $android_users[] = $target_user;
                }
                if( $target_user->device_type == 'ios' ){
                    $ios_users[] = $target_user;
                }
            }
            //send notification to android user
            if( count($android_users) ){
                $notification_data = [
                    'actor'            => $request['user'],
                    'actor_type'      => 'users',
                    'target'           => $android_users,
                    'target_type'      => 'users',
                    'title'            => env('APP_NAME'),
                    'message'          => __('app.member_removed_msg',['actor' => $request['user']->name, 'shotlist' =>  $target_users[0]->shot_list_name ]),
                    'reference_id'     => $target_users[0]->shot_list_id,
                    'reference_module' => 'shot_list',
                    'redirect_link'    => NULL,
                    'badge'            => 0
                ];
                $custom_data = [
                    'record_id'     => $target_users[0]->shot_list_id,
                    'redirect_link' => NULL,
                    'identifier'    => 'remove_member',
                    'shot_list_id'  => $target_users[0]->shot_list_id
                ];
                Notification::sendPushNotification('remove_member',$notification_data,$custom_data,'android');
            }
            //send notification to ios user
            if( count($ios_users) ){
                $notification_data = [
                    'actor'            => $request['user'],
                    'actor_type'      => 'users',
                    'target'           => $ios_users,
                    'target_type'      => 'users',
                    'title'            => env('APP_NAME'),
                    'message'          => __('app.member_removed_msg',['actor' => $request['user']->name, 'shotlist' =>  $target_users[0]->shot_list_name ]),
                    'reference_id'     => $target_users[0]->shot_list_id,
                    'reference_module' => 'shot_list',
                    'redirect_link'    => NULL,
                    'badge'            => 0
                ];
                $custom_data = [
                    'record_id'     => $target_users[0]->shot_list_id,
                    'redirect_link' => NULL,
                    'identifier'    => 'remove_member',
                    'shot_list_id'  => $target_users[0]->shot_list_id
                ];
                Notification::sendPushNotification('remove_member',$notification_data,$custom_data,'ios');
            }
        }
    }

    public function store()
    {
        $request = $this->__request;
        $param_rule['shot_list_id'] = 'required';
        $param_rule['target_id']    = 'required';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

        $shotList = ShotList::find($request['shot_list_id']);
        $record   = UserMemberShotList::addMembers($request->all());

        //push notification to android users
        $getAndroidUsers = User::getUserByDeviceType('android',$request['target_id']);
        if( count($getAndroidUsers) ){
            $notification_data = [
                'actor'            => $request['user'],
                'actor_type'      => 'users',
                'target'           => $getAndroidUsers,
                'target_type'      => 'users',
                'title'            => env('APP_NAME'),
                'message'          => __('app.member_added_msg',['actor' => $request['user']->name, 'shotlist' =>  $shotList->name ]),
                'reference_id'     =>  $request['shot_list_id'],
                'reference_module' => 'shot_list',
                'redirect_link'    => NULL,
                'badge'            => 0
            ];
            $custom_data = [
                'record_id'     => $request['shot_list_id'],
                'redirect_link' => NULL,
                'identifier'    => 'add_member',
                'shot_list_id'  => $request['shot_list_id']
            ];
            Notification::sendPushNotification('add_member',$notification_data,$custom_data,'android');
        }
        //push notification to ios users
        $getIosUsers = User::getUserByDeviceType('ios',$request['target_id']);
        if( count($getIosUsers) ){
            $notification_data = [
                'actor'            => $request['user'],
                'actor_type'      => 'users',
                'target'           => $getIosUsers,
                'target_type'      => 'users',
                'title'            => env('APP_NAME'),
                'message'          => __('app.member_added_msg',['actor' => $request['user']->name, 'shotlist' =>  $shotList->name ]),
                'reference_id'     => $request['shot_list_id'],
                'reference_module' => 'shot_list',
                'redirect_link'    => NULL,
                'badge'            => 0
            ];
            $custom_data = [
                'record_id'     => $request['shot_list_id'],
                'redirect_link' => NULL,
                'identifier'    => 'add_member',
                'shot_list_id'  => $request['shot_list_id']
            ];
            Notification::sendPushNotification('add_member',$notification_data,$custom_data,'ios');
        }

        $this->__is_paginate = false;
        return $this->__sendResponse($record, 200, __('app.success_listing_message'));
    }
}
