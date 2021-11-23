<?php

namespace Retrocube\UserFollow\Http\Controllers;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use Retrocube\UserFollow\Models\UserFollow;

class UserFollowController extends RestController
{
    public function __construct(Request $request)
    {
        parent::__construct('UserFollow');
        $this->__request      = $request;
        $this->__apiResource  = 'UserFollow';
        $this->__apiResourcePath  = '\Retrocube\UserFollow\Http\Resources\\';
        $this->__model_path       = '\Retrocube\UserFollow\Models\\';
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
                    'type' => 'required|in:follower,following,request',
                ]);
                break;
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'target_id' => 'required|exists:users,id',
                ]);
                break;
            case 'PUT':
                $this->__request->merge(['slug' => $slug]);
                $validator = Validator::make($this->__request->all(), [
                    'status' => 'required|in:1',
                    'slug'   => 'required|exists:user_follow,slug,status,0,target_id,' . $this->__request['user']->id
                ]);
                break;
            case 'DELETE':
                $user = $this->__request['user'];
                $this->__request->merge(['slug' => $slug]);
                $validator = Validator::make($this->__request->all(), [
                    'slug'   => [
                        'required',
                        Rule::exists('user_follow')->where(function ($query) use ($slug,$user){
                            return $query->where('slug',$slug)
                                         ->where(function($where) use ($user){
                                             $where->orWhere('actor_id',$user->id);
                                             $where->orWhere('target_id',$user->id);
                                         });
                        }),
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
        $checkRequest = UserFollow::checkFollowRequest($request['user']->id,$request['target_id']);
        if( isset($checkRequest->id) ){
            $this->__is_error = true;
            if( $checkRequest->status == 0 )
                return $this->__sendError(__('app.validation_msg'),['message' => 'app.follow_request_pending'],400);
            if( $checkRequest->status == 1 )
                return $this->__sendError(__('app.validation_msg'),['message' => 'app.follow_request_accepted'],400);
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
    public function beforeUpdateLoadModel($request, $slug)
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

    public function acceptRequest()
    {

    }

    public function getFollowRequest()
    {

    }
}
