<?php

namespace App\Models;

use App\Helpers\CustomHelper;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class User extends Authenticatable
{
    use HasFactory, CRUDGenerator, SoftDeletes;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'users';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_group_id', 'name', 'username', 'slug', 'email', 'mobile_no', 'password', 'image_url', 'status', 'is_email_verify', 'email_verify_at', 'is_mobile_verify', 'mobile_verify_at', 'country', 'city', 'state', 'zipcode', 'address', 'latitude', 'longitude', 'online_status','mobile_otp', 'email_otp', 'remember_token', 'created_at', 'updated_at', 'deleted_at'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'remember_token'
    ];

    /**
     * It is used to enable or disable DB cache record
     * @var bool
     */
    protected $__is_cache_record = true;

    /**
     * @var
     */
    protected $__cache_signature;

    /**
     * @var string
     */
    protected $__cache_expire_time = 1; //days

    public function userApiToken()
    {
        return $this->hasMany(UserApiToken::class,'user_id','id');
    }

    /**
     * This function is used to generate unique username
     * @param string $username
     * @return string $username
     */
    public static function generateUniqueUserName($username)
    {
        $username = Str::slug($username);
        $query = self::where('username',$username)->count();
        if( $query > 0){
            $username = $username . $query . rand(111,999);
        }
        return Str::slug($username);
    }

    /**
     * This function is used to get user by email
     * @param $email
     * @return object $query
     */
    public static function getUserByEmail($email)
    {
        $query = self::where('email',$email)->first();
        return $query;
    }

    /**
     * This function is used to update user device token
     * @param illuminate\http\request $request
     * @param object $user
     * @return bool
     */
    public static function updateDeviceToken($request,$user, $platform_type = 'custom')
    {
        $api_token  = UserApiToken::generateApiToken($user->id,$request->ip(),$request->header('token'),$user->created_at);
        $record = UserApiToken::updateOrCreate(
            ['api_token' => $api_token],
            [
                'user_id'       => $user->id,
                'api_token'     => $api_token,
                'refresh_token' => UserApiToken::generateRefreshToken($user->id),
                'udid'          => $request->header('token'),
                'device_type'   => $request['device_type'],
                'device_token'  => $request['device_token'],
                'platform_type' => $platform_type,
                'ip_address'    => $request->ip(),
                'user_agent'    => $request->server('HTTP_USER_AGENT'),
                'created_at'    => Carbon::now(),
            ]
        );
        //new device login attempt
        if( !$record->wasChanged() ){

        }
        return $api_token;
    }

    /**
     * @param $email
     * @param string $module
     * @return false|object
     */
    public static function ForgotPassword($email, $module = 'users')
    {
        $user = self::getUserByEmail($email);
        if( !isset($user->id) )
            return false;
        elseif( $user->status != 1)
            return false;

        $reset_pass_token = Str::random(150);
        ResetPassword::insert([
            'module'     => $module,
            'email'      => $email,
            'token'      => $reset_pass_token,
            'created_at' => Carbon::now(),
        ]);
        //send reset password email
        $mail_params['USERNAME'] = $user->name;
        $mail_params['LINK']     = route('reset-password',['any' => $reset_pass_token]);
        $mail_params['YEAR']     = date('Y');
        $mail_params['APP_NAME'] = env('APP_NAME');
        CustomHelper::sendMail($user->email,'forgot-password',$mail_params);

        return $user;
    }

    public static function updateUser($user_id,$data)
    {
        self::where('id',$user_id)->update($data);
    }

    public static function updateUserByEmail($email,$data)
    {
        self::where('email',$email)->update($data);
    }

    public static function getUserByApiToken($api_token)
    {
        $user = self::select('users.*')
                    ->selectRaw('api_token,device_type,device_token,platform_type,platform_id')
                    ->join('user_api_token AS uat','uat.user_id','=','users.id')
                    ->where('uat.api_token',$api_token)
                    ->first();
        return $user;
    }

    public static function userLogout($params)
    {
        UserApiToken::where('api_token',$params['api_token'])->forceDelete();
        return true;
    }

    public static function socialUser($params)
    {
        $data = new \stdClass();
        if( empty($params['email']) )
            $user = self::getUserByPlatformID($params['platform_type'],$params['platform_id']);
        else
            $user = self::getUserByEmail($params['email']);
        //upload image by url
        if( !empty($params['image_url']) )
            $image_url = null;
        else
            $image_url = null;
        //create new user
        if( !isset($user->id) ){
            $created_at    = Carbon::now();
            $temp_password = Str::random(8);
            $username      = self::generateUniqueUserName($params['name']);
            $record_id = self::insertGetId([
                'user_group_id'   => 1,
                'name'            => $params['name'],
                'username'        => $username,
                'slug'            => $username,
                'email'           => !empty($params['email']) ? $params['email'] : null,
                'password'        => Hash::make($temp_password),
                'mobile_no'       => !empty($params['mobile_no']) ? $params['mobile_no'] : null,
                'image_url'       => $image_url,
                'is_email_verify' => 1,
                'latitude'        => !empty($params['latitude']) ? $params['latitude'] : null,
                'longitude'       => !empty($params['longitude']) ? $params['longitude'] : null,
                'created_at'      => Carbon::now(),
            ]);
            $data->id = $record_id;
            $data->created_at = $created_at;
        } else {
            //update existing user
            $update_data = [];
            if( !empty($params['name']) )
                $update_data['name'] = $params['name'];
            if( !empty($params['image_url']) )
                $update_data['image_url'] = $image_url;
            if( !empty($params['latitude']) && !empty($params['longitude']) )
                $update_data['latitude'] = $params['latitude'];
                $update_data['longitude'] = $params['longitude'];

            $update_data['is_email_verify'] = 1;
            $update_data['updated_at']      = Carbon::now();
            if( !empty($update_data) )
                self::where('id',$user->id)->update($update_data);

            $data->id = $user->id;
            $data->created_at = $user->created_at;
        }
        return $data;
    }

    public static function getUserByPlatformID($platform_type,$platform_id)
    {
        $query = self::select('users.*')
                    ->selectRaw('api_token,device_type,device_token,platform_type,platform_id')
                    ->join('user_api_token AS uat','uat.user_id','=','users.id')
                    ->where('platform_type',$platform_type)
                    ->where('platform_id',$platform_id)
                    ->first();
        return $query;
    }

    public static function getUserApiTokenByID($user_id)
    {
        $query = self::select('users.*','uat.device_type','uat.device_token')
                    ->join('user_api_token AS uat','uat.user_id','=','users.id')
                    ->where('uat.user_id',$user_id)
                    ->get();
        return $query;
    }
}
