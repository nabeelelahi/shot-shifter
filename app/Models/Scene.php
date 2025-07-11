<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Http\Resources\Scene AS SceneResource;

class Scene extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'scenes';

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
        'event_id','shot_list_id', 'type', 'size', 'title', 'slug', 'image_url', 'description', 'angle', 'lens', 'internal_external',
        'sun_time', 'location', 'location_pin', 'cast', 'wardrobe', 'props', 'action', 'speed', 'sound', 'timepicker', 'date', 'sub_heading',
        'time','grip','lines_dialogue_english', 'lines_dialogue_foreign', 'camera', 'is_complete', 'sort_order', 'shoot_sort_order',
        'scene_no', 'is_schedule', 'status', 'created_at', 'updated_at', 'deleted_at'
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
    protected $__is_cache_record = false;

    /**
     * @var
     */
    protected $__cache_signature;

    /**
     * @var string
     */
    protected $__cache_expire_time = 1; //days

    public function shotList()
    {
        return $this->belongsTo(ShotList::class,'shot_list_id','id');
    }

    public function breaks()
    {
        return $this->hasMany(Breaks::class,'scene_id','id');
    }

    public static function markAsComplete($params)
    {
        self::where('id',$params['scene_id'])
            ->update([
                'is_complete' => 1
            ]);
        // update complete counter
        if( $params['type'] == 'scene' ){
            \DB::table('shot_list')
                ->where('id',$params['shot_list_id'])
                ->increment('total_completed_scene',1);
        }
        return true;
    }

    public static function getMaxSortOrder($shot_list_id)
    {
        $query = self::selectRaw('
                        IFNULL(MAX(sort_order),0) AS sort_order,
                        IFNULL(MAX(shoot_sort_order),0) AS shoot_sort_order,
                        COUNT( case type when "scene" then 1 else null end) AS total_scene
                    ')
                    ->where('shot_list_id',$shot_list_id)
                    ->first();
        return $query;
    }

    public static function reOrderRecords($json_data,$type = 'schedule')
    {
        if( count($json_data) && $type == 'schedule' ){
            $sort_order = 1;
            foreach($json_data as $scene){
                if( $scene['title'] == 'unschedule' ){
                    break;
                }
                $data[] = [
                    'id' => $scene['id'],
                    'shoot_sort_order' => $sort_order,
                    'is_schedule' => '1'
                ];
                $sort_order++;
            }
            self::upsert($data,['id'],['shoot_sort_order','is_schedule']);
        } else {
            $sort_order = 1;
            foreach($json_data as $scene){
                $data[] = [
                    'id' => $scene['id'],
                    'sort_order' => $sort_order,
                ];
                $sort_order++;
            }
            self::upsert($data,['id'],['sort_order']);
        }
        return true;
    }

    public static function getAllScenes($shot_list_id,$mode,$keyword=NULL)
    {
        $query = Scene::with(['shotList'])
                    ->where('shot_list_id',$shot_list_id);

        if( !empty($keyword) ){
            $query->where( function($where) use ($keyword){
                $where->orWhere('title','like',"%$keyword%");
                $where->orWhere('description','like',"%$keyword%");
            });
        }

        if( $mode == 'story' ){
            $query->where('type','scene');
            $query->orderBy('sort_order','asc');
        }
        if( $mode == 'schedule' ){
            $query->orderBy('shoot_sort_order','asc');
        }

        $records = $query->take(1000)->get();
        return $records;
    }

    public static function sortScenes($scenes,$mode = 'schedule')
    {
        $unschedule_records[] = [
            'id'           => 0,
            "shot_list_id" => 1,
            'type'         => 'day',
            'title'        => 'unschedule',
            'size'         => null,
            'date'         =>  null,
            'sub_heading'  =>  null,
            'slug'         =>  null,
            'image_url'    =>  null,
            'description'  =>  null,
            'angle'        =>  null,
            'lens'         =>  null,
            'internal_external' =>  null,
            'sun_time'     =>  null,
            'location'     =>  null,
            'location_pin' =>  null,
            'cast'         =>  null,
            'wardrobe'     =>  null,
            'props'        =>  null,
            'action'       =>  null,
            'speed'        =>  null,
            'sound'        =>  null,
            'timepicker'   =>  null,
            'grip'         =>  null,
            'lines_dialogue_english' =>  null,
            'lines_dialogue_foreign' =>  null,
            'camera'      =>  null,
            'is_complete' =>  null,
            'sort_order'  =>  0,
            'schedule_sort_order' =>  0,
            'scene_no'    =>  0,
            'is_schedule' =>  null,
            'created_at'  =>  null,
            'index_no'    =>  null,
        ];
        $schedule_record = [];
        $final_data = [];
        if( count($scenes) && $mode == 'schedule' ){
            foreach( $scenes as $record ){
                if( $record->is_schedule == 1 ){
                    $schedule_record[] = new SceneResource($record);
                } else {
                    $unschedule_records[] = new SceneResource($record);
                }
            }
            if( count($unschedule_records) > 1 && $scenes[0]->shotList->schedule_lock == 0 ){
                $final_data = [...$schedule_record,...$unschedule_records];
            } else {
                $final_data = $schedule_record;
            }
        } else {
            $final_data = SceneResource::collection($scenes);
        }

        return $final_data;
    }

    public static function getLastActivity($user_id,$shot_list_id)
    {
        $query = \DB::table('schedule_activity')
                    ->where('shot_list_id',$shot_list_id)
                    ->where('user_id',$user_id)
                    ->orderBy('id','desc')
                    ->first();
        return $query;
    }

    public static function deleteLastActivity($last_activity_id)
    {
        \DB::table('schedule_activity')->where('id',$last_activity_id)->delete();
        return true;
    }

    public static function restoreScene($scene_id)
    {
        self::onlyTrashed()->where('id', $scene_id)->restore();
        return true;
    }

    public static function restoreSceneUpdate($scene_id,$old_record)
    {
        self::where('id',$scene_id)->update($old_record);
        return true;
    }

    public static function resetScene($shot_list_id)
    {
        ShotList::where('id',$shot_list_id)->update(['schedule_lock' => '0']);

        self::where('shot_list_id',$shot_list_id)
            ->whereIn('type',['day','event'])
            ->forceDelete();

        self::where('shot_list_id',$shot_list_id)
            ->update([
                    'is_complete' => '0',
                    'is_schedule' => '0'
                ]);

        return true;
    }

    public static function UpdateAllScenes($scenes)
    {
        foreach ($scenes as $sceneData) {
            $scene = self::find($sceneData['id']);
            if ($scene) {
                // Update the fields
                $scene->type = $sceneData['type'] ?? $scene->type;
                $scene->shot_list_id = $sceneData['shot_list_id'] ?? $scene->shot_list_id;
                $scene->size = $sceneData['size'] ?? $scene->size;
                $scene->title = $sceneData['title'] ?? $scene->title;
                $scene->slug = $sceneData['slug'] ?? $scene->slug;
                $scene->image_url = $sceneData['image_url'] ?? $scene->image_url;
                $scene->description = $sceneData['description'] ?? $scene->description;
                $scene->date = $sceneData['date'] ?? $scene->date;
                $scene->sub_heading = $sceneData['sub_heading'] ?? $scene->sub_heading;
                $scene->angle = $sceneData['angle'] ?? $scene->angle;
                $scene->lens = $sceneData['lens'] ?? $scene->lens;
                $scene->internal_external = $sceneData['internal_external'] ?? $scene->internal_external;
                $scene->sun_time = $sceneData['sun_time'] ?? $scene->sun_time;
                $scene->location = $sceneData['location'] ?? $scene->location;
                $scene->location_pin = $sceneData['location_pin'] ?? $scene->location_pin;
                $scene->cast = $sceneData['cast'] ?? $scene->cast;
                $scene->wardrobe = $sceneData['wardrobe'] ?? $scene->wardrobe;
                $scene->props = $sceneData['props'] ?? $scene->props;
                $scene->action = $sceneData['action'] ?? $scene->action;
                $scene->speed = $sceneData['speed'] ?? $scene->speed;
                $scene->sound = $sceneData['sound'] ?? $scene->sound;
                $scene->timepicker = $sceneData['timepicker'] ?? $scene->timepicker;
                $scene->lines_dialogue_english = $sceneData['lines_dialogue_english'] ?? $scene->lines_dialogue_english;
                $scene->lines_dialogue_foreign = $sceneData['lines_dialogue_foreign'] ?? $scene->lines_dialogue_foreign;
                $scene->camera = $sceneData['camera'] ?? $scene->camera;
                $scene->grip = $sceneData['grip'] ?? $scene->grip;
                $scene->is_complete = $sceneData['is_complete'] ?? $scene->is_complete;
                $scene->sort_order = $sceneData['sort_order'] ?? $scene->sort_order;
                $scene->shoot_sort_order = $sceneData['shoot_sort_order'] ?? $scene->shoot_sort_order;
                $scene->scene_no = $sceneData['scene_no'] ?? $scene->scene_no;
                $scene->is_schedule = $sceneData['is_schedule'] ?? $scene->is_schedule;
                $scene->status = $sceneData['status'] ?? $scene->status;
                
                $scene->save();
            }
        }
    }


}
