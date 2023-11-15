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
        'grip','lines_dialogue_english', 'lines_dialogue_foreign', 'camera', 'is_complete', 'sort_order', 'shoot_sort_order',
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

    public static function reOrderRecords($json_data)
    {
        if( count($json_data) ){
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
        }
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
            $query->orderBy('scene_no','asc');
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
            'id'    => 0,
            "shot_list_id" => 1,
            'type'  => 'day',
            'title' => 'unschedule'
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
            if( count($unschedule_records) > 1 ){
                $final_data = [...$schedule_record,...$unschedule_records];
            } else {
                $final_data = $schedule_record;
            }
        } else {
            $final_data = $scenes;
        }

        return $final_data;
    }
}
