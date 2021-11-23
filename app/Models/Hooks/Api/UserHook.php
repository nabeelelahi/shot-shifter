<?php

namespace App\Models\Hooks\Api;

use App\Helpers\CustomHelper;
use App\Models\UserApiToken;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserHook
{
    private $_model,
            $except_update_params = [
                'username',
                'slug',
                'email',
                'mobile_no',
                'password',
                'status',
                'is_email_verify',
                'is_mobile_verify',
                'mobile_otp',
                'email_otp',
                'remember_token',
            ];

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
    public function hook_query_index(&$query,$request, $slug=NULL) {
        //Your code here

        $query->select('users.*');
        //check same user
        if( $request['user']->slug == $slug ){
            $query->selectRaw('api_token,device_type,device_token,platform_type,platform_id')
                ->join('user_api_token AS uat','uat.user_id','=','users.id')
                ->where('uat.api_token',$request['api_token']);
        }
        if( $slug == '' ){
            $query->where('id','!=',$request['user']->id);
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
        //delete un-verified account
        if( env('VERIFICATION_TYPE') != 'none'){
            if( env('VERIFICATION_TYPE') == 'email'){
                $this->_model::where('email',$postdata['email'])->forceDelete();
            }
            if( env('VERIFICATION_TYPE') == 'mobile'){
                $this->_model::where('mobile_no',$postdata['mobile_no'])->forceDelete();
            }
        }

        //set data
        $postdata['user_group_id'] = 1;
        $postdata['username']   = $this->_model::generateUniqueUserName($postdata['name']);
        $postdata['slug']       = $postdata['username'];
        $postdata['password']   = Hash::make($postdata['password']);
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
        $api_token  = UserApiToken::generateApiToken($record->id,$request->ip(),$request->header('token'),$record->created_at);
        $request['api_token'] = $api_token;
        $request['user']      = $record;
        //insert api token
        \DB::table('user_api_token')
            ->insert([
                'user_id'       => $record->id,
                'api_token'     => $api_token,
                'refresh_token' => UserApiToken::generateRefreshToken($record->id),
                'udid'          => $request->header('token'),
                'device_type'   => $request['device_type'],
                'device_token'  => $request['device_token'],
                'platform_type' => !empty($request['platform_type']) ? $request['platform_type'] : 'custom',
                'platform_id'   => !empty($request['platform_id']) ? $request['platform_id'] : NULL,
                'ip_address'    => $request->ip(),
                'user_agent'    => $request->server('HTTP_USER_AGENT'),
                'created_at'    => Carbon::now()
            ]);
        //send verification email
        if( env('VERIFICATION_TYPE') == 'email' ){
            $mail_params['USERNAME'] = $record->name;
            $mail_params['LINK']     = route('verifyEmail',['name' => encrypt($record->email)]);
            $mail_params['YEAR']     = date('Y');
            $mail_params['APP_NAME'] = env('APP_NAME');
            CustomHelper::sendMail($record->email,'user_registration',$mail_params);
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
        foreach( $postData as $key => $value ){
            if( in_array($key,$this->except_update_params) )
                unset($postData[$key]);
        }
        if( !empty($postData['image_url']) ){
            $postData['image_url'] = CustomHelper::uploadMedia('users',$postData['image_url']);
        }
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
    public function hook_after_delete($request,$records) {
        //Your code here

    }

    public function create_cache_signature($request)
    {
        $cache_params = $request->isMethod('post') ? [] : $request->except(['user','api_token']);
        return 'users_api_' . md5(implode('',$cache_params));
    }
}
