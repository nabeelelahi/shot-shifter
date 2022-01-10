<?php

namespace App\Helpers;

use App\Models\ApplicationSetting;
use App\Models\CmsModule;
use App\Models\CmsUser;
use App\Models\MailTemplate;
use Illuminate\Http\File;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;
use Intervention\Image\Facades\Image;

class CustomHelper
{
    /**
     * This function is used to get login user
     * @return \Illuminate\Contracts\Auth\Authenticatable|null
     */
    public static function currentUser( $guard = 'cms_user' )
    {
        $user = Auth::guard($guard)->user();
        if( $guard == 'cms_user' )
            $data = CmsUser::getCmsUserByID(isset($user->id) ? $user->id : 0);
        else
            $data = $user;
        return $data;
    }

    /**
     * This function is used to send email
     * @param string $to
     * @param string $identifier
     * @param array $params
     * @param array $cc_emails
     * @param array $attachment_path
     */
    public static function sendMail($to,$identifier,$params, $cc_emails=[], $attachment_path=[])
    {
        $template = MailTemplate::where('identifier',$identifier)->first();

        if( isset($template->id) )
        {
            $mail_subject   = $template->subject;
            $mail_body      = $template->body;
            $mail_wildcards = explode(',', $template->wildcard);

            $mail_wildcard_values = [];
            foreach($mail_wildcards as $value) {
                $value = str_replace(['[',']'],'', $value);
                $mail_wildcard_values[] = $params[$value];
            }

            $mail_subject = str_replace($mail_wildcards, $mail_wildcard_values, $mail_subject);
            $mail_body    = str_replace($mail_wildcards, $mail_wildcard_values, $mail_body);

            $queue = env('IS_QUEUE_ENABLE',0) ? 'queue' : 'send';
            if( !empty($cc_emails) ){
                Mail::to($to)
                    ->cc($cc_emails)
                    ->{$queue}(new \App\Mail\DefaultEmail($mail_body,$mail_subject,$cc_emails, $attachment_path));
            } else {
                Mail::to($to)->{$queue}(new \App\Mail\DefaultEmail($mail_body,$mail_subject, $attachment_path));
            }
        }
    }

    /**
     * This function is used to upload single file or multiple files
     * @param string $destination_path
     * @param object|array $file
     * @param null $resize
     * @return bool
     */
    public static function uploadMedia($destination_path,$file,$resize = NULL)
    {
        if(is_array($file)){
            foreach ($file as $value)
            {
                $extension  = $value->extension();
                $fileUrl   = Storage::put($destination_path, $value);
                if($extension == 'jpg' || $extension = 'png' || $extension == 'jpeg')
                    self::resize($destination_path,$fileUrl,$resize);

                $filename[] = $fileUrl;
            }
        }else{
            $extension  = $file->extension();
            $filename = Storage::put($destination_path, $file);
            if($extension == 'jpg' || $extension = 'png' || $extension == 'jpeg')
                self::resize($destination_path,$filename,$resize);
        }
        return $filename;
    }

    /**
     * This function is used to upload single file or multiple files by path
     * @param string $destination_path
     * @param object|array $file
     * @param null $resize
     * @return bool
     */
    public static function uploadMediaByPath($destination_path,$file,$resize = NULL)
    {
        if(is_array($file)){
            foreach ($file as $value)
            {
                $extension  = $value->extension();
                $fileUrl   = Storage::putFile($destination_path, new File($value));
                if($extension == 'jpg' || $extension = 'png' || $extension == 'jpeg')
                    self::resize($destination_path,$fileUrl,$resize);

                $filename[] = $fileUrl;
            }
        }else{
            $extension  = pathinfo($file,PATHINFO_EXTENSION);
            $filename = Storage::putFile($destination_path, new File($file));
            if($extension == 'jpg' || $extension = 'png' || $extension == 'jpeg')
                self::resize($destination_path,$filename,$resize);
        }
        return $filename;
    }

    /**
     * This function is used to resize upload image
     * @param string $destination_path
     * @param string $file
     * @param string $dimension
     */
    public static function resize($destination_path,$file,$dimension)
    {
        if(!empty($dimension)){
            $getImageDimension = explode('x',strtolower($dimension));
            $resizeWidth       = $getImageDimension[0];
            $resizeHeight      = $getImageDimension[1];
            Image::make(Storage::path($file))
                ->resize($resizeWidth, $resizeHeight,function($constraint){
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })
                ->save( Storage::path($destination_path . '/thumb_' . basename($file)) );
        }
    }

    /**
     * This function is used to optimize upload image
     * @param string $source_path
     * @param string $destination_path
     * @param integer $quality
     * @return mixed
     */
    public static function optimizeImage($source_path, $destination_path, $quality)
    {
        $info = getimagesize($source_path);
        if ($info['mime'] == 'image/jpeg')
            $image = imagecreatefromjpeg($source_path);
        elseif ($info['mime'] == 'image/gif')
            $image = imagecreatefromgif($source_path);
        elseif ($info['mime'] == 'image/png')
            $image = imagecreatefrompng($source_path);

        //save file
        imagejpeg($image, $destination_path, $quality);

        //return destination file
        return $destination_path;
    }

    /**
     * This function is used to get application by identifier
     * @param string $identifer
     * @param string $meta_key
     * @return array | string
     */
    public static function appSetting(string $identifer, string $meta_key = NULL)
    {
        Cache::forget('setting_application_setting');
        $meta_value = '';
        $records = Cache::rememberForever('setting_' . $identifer, function () use ($identifer) {
            return ApplicationSetting::getRecords($identifer);
        });
        if( count($records) ){
            foreach($records as $record){
                if( !empty($meta_key) && $record->meta_key == $meta_key ){
                    $meta_value = (!empty($record->is_file) && $record->is_file == 1)  ? URL::to($record->value) : $record->value;
                }
            }
        }
        return $meta_value;
    }

    /**
     * This function is used to get current route privilege
     * @return object $record
     */
    public static function modulePermission()
    {
        return CmsModule::getCurrentRoutePrivilege();
    }
}
