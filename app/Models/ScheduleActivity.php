<?php
namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Route;

class ScheduleActivity extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'schedule_activity';

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
        'user_id', 'scene_id', 'shot_list_id', 'http_verb', 'action_name', 'request_payload', 'response',
        'old_record', 'created_at', 'updated_at', 'deleted_at'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

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

    public static function sceneCreateActivity($request,$response)
    {
        if( $request['type'] != 'scene' ){
            $data = $response->getData();
            ScheduleActivity::insert([
                'user_id'  => $request['user']->id,
                'scene_id' => $data->data->id,
                'shot_list_id' => $data->data->shot_list_id,
                'http_verb' => $request->method(),
                'action_name' => Route::currentRouteName(),
                'request_payload' => json_encode($request->all()),
                'response' => json_encode($data->data),
                'created_at' => Carbon::now(),
            ]);
        }
        return true;
    }

    public static function sceneUpdateActivity($request,$response,$old_record)
    {
        if( $request['type'] != 'scene' ){
            $data = $response->getData();
            ScheduleActivity::insert([
                'user_id'  => $request['user']->id,
                'scene_id' => $data->data->id,
                'shot_list_id' => $data->data->shot_list_id,
                'http_verb' => $request->method(),
                'action_name' => Route::currentRouteName(),
                'request_payload' => json_encode($request->all()),
                'response' => json_encode($data->data),
                'old_record' => $old_record,
                'created_at' => Carbon::now(),
            ]);
        }
        return true;
    }
    public static function bulkUpdateScenesActivity($request, $scenes)
    {
        $user_id = $request['user']->id;
        $method = $request->method();
        $action_name = Route::currentRouteName();
        $now = Carbon::now();

        $activities = [];
        foreach ($scenes as $scene) {
            // Check if the scene type is not 'scene' before inserting activity
            if ($scene->type != 'scene') {
                $activity = [
                    'user_id' => $user_id,
                    'scene_id' => $scene->id,
                    'shot_list_id' => $scene->shot_list_id,
                    'http_verb' => $method,
                    'action_name' => $action_name,
                    'request_payload' => json_encode($request->all()),
                    'response' => json_encode($scene),
                    'created_at' => $now,
                ];
                $activities[] = $activity;
            }
        }

        // Insert activities in bulk
        ScheduleActivity::insert($activities);

        return true;
    }

    public static function sceneDeleteActivity($request,$response)
    {
        $url   = explode('/',$request->url());
        $slug  = end($url);
        $scene = Scene::onlyTrashed()->where('slug',$slug)->first();
        if( $scene->type != 'scene' ){
            ScheduleActivity::insert([
                'user_id'  => $request['user']->id,
                'scene_id' => $scene->id,
                'shot_list_id' => $scene->shot_list_id,
                'http_verb' => $request->method(),
                'action_name' => Route::currentRouteName(),
                'request_payload' => json_encode($request->all()),
                'response' => json_encode($scene),
                'created_at' => Carbon::now(),
            ]);
        }
        return true;
    }

    public static function sceneCompletedActivity($request,$response)
    {
        $data = $response->getData();
        ScheduleActivity::insert([
            'user_id'  => $request['user']->id,
            'scene_id' => $request['scene_id'],
            'shot_list_id' => $request['shot_list_id'],
            'http_verb' => $request->method(),
            'action_name' => Route::currentRouteName(),
            'request_payload' => json_encode($request->all()),
            'response' => json_encode($data->data),
            'created_at' => Carbon::now(),
        ]);
        return true;
    }

    public static function sceneReOrderActivity($request,$response)
    {
        $data   = $response->getData();
        $params = $request->all();
        ScheduleActivity::insert([
            'user_id'  => $request['user']->id,
            'scene_id' => 0,
            'shot_list_id' => $params[0]['shot_list_id'],
            'http_verb' => $request->method(),
            'action_name' => Route::currentRouteName(),
            'request_payload' => json_encode($request->all()),
            'response' => json_encode($data->data),
            'created_at' => Carbon::now(),
        ]);
        return true;
    }
}
