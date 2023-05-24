<?php
namespace App\Models;

use App\Helpers\CustomHelper;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

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
        'event_id','shot_list_id', 'size', 'title', 'slug', 'image_url', 'description', 'angle', 'lens', 'internal_external',
        'sun_time', 'location', 'location_pin', 'cast', 'wardrobe', 'props', 'action', 'speed', 'sound', 'timepicker',
        'grip','lines_dialogue_english', 'lines_dialogue_foreign', 'camera', 'is_complete', 'sort_order', 'shoot_sort_order',
        'scene_no', 'status', 'created_at', 'updated_at', 'deleted_at'
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
        \DB::table('shot_list')
            ->where('id',$params['shot_list_id'])
            ->increment('total_completed_scene',1);
        //get updated scene
        $getScene = self::with(['breaks'])
                        ->select('scenes.*')
                        ->where('id',$params['scene_id'])
                        ->first();

        return $getScene;
    }

    public static function getMaxSortOrder($shot_list_id)
    {
        $query = self::selectRaw('IFNULL(MAX(sort_order),0) AS sort_order, IFNULL(MAX(shoot_sort_order),0) AS shoot_sort_order, COUNT(*) AS total_scene')
                    ->where('shot_list_id',$shot_list_id)
                    ->first();
        return $query;
    }

    public static function reOrderRecords($params,$request)
    {
        $api_data = [];
        $sort_order_index = $params['old_sort_order'] > $params['new_sort_order'] ? $params['new_sort_order'] : $params['old_sort_order'];
        $subtract_index   = $params['old_sort_order'] > $params['new_sort_order'] ? true : false;
        $max_index        = $params['old_sort_order'] > $params['new_sort_order'] ? $params['old_sort_order'] : $params['new_sort_order'];

        $query = self::with(['shotList','breaks'])
                        ->where('shot_list_id',$params['shot_list_id']);
        if( $params['mode'] == 'story' ){
            $query->whereBetween('sort_order',[$sort_order_index,$max_index])
                  ->orderBy('sort_order','asc');
        } else {
            $query->whereBetween('shoot_sort_order',[$sort_order_index,$max_index])
                  ->orderBy('shoot_sort_order','asc');
        }
        $records = $query->get();
        if( count($records) ){
           foreach( $records as $record ){
                if( $record->id == $params['scene_id'] ){
                    $sort_order = $params['new_sort_order'];
                } else {
                    if( $params['mode'] == 'story' ){
                        $sort_order = $subtract_index ? ($record->sort_order + 1) : ($record->sort_order - 1);
                    } else {
                        $sort_order = $subtract_index ? ($record->shoot_sort_order + 1) : ($record->shoot_sort_order - 1);
                    }
                }
                $cases[]  = "WHEN {$record->id} then ?";
                $data[]   = $sort_order;
                $ids[]    = $record->id;
                $record->sort_order = $sort_order;
                $api_data[] = $record;

                $sort_order_index++;
            }
            $ids = implode(',', $ids);
            $cases = implode(' ', $cases);
            if( $params['mode'] == 'story' )
                \DB::update("UPDATE scenes SET `sort_order` = CASE `id` {$cases} END WHERE `id` in ({$ids})", $data);
            else
                \DB::update("UPDATE scenes SET `shoot_sort_order` = CASE `id` {$cases} END WHERE `id` in ({$ids})", $data);

        }
        // $query = self::with(['shotList','breaks'])
        //                 ->where('shot_list_id',$params['shot_list_id']);
        // if( $params['mode'] == 'story' ){
        //     $query->orderBy('sort_order','asc');
        // } else {
        //     $query->orderBy('shoot_sort_order','asc');
        // }
        // $records = $query->take(200)->get();

        $records = self::getEventScenes($request);
        return $records;
    }

    public static function getAllScenes($params)
    {
        $params['mode'] = !empty($params['mode']) ? $params['mode'] : 'story';
        $query = self::with(['shotList','breaks'])
                        ->where('shot_list_id',$params['shot_list_id']);

        if( $params['mode'] == 'story' ){
            $query->orderBy('sort_order','asc');
        } else {
            $query->orderBy('shoot_sort_order','asc');
        }
        $records = $query->take(200)->get();
        return $records;
    }

    public static function getEventScenes($request,$slug=NULL)
    {
        $query = Event::select('events.*')
            ->with(['scenes' => function($relQuery) use ($request){
                $relQuery->with(['breaks']);

                if( !empty($request['mode']) ){
                    if( $request['mode'] == 'story' ){
                        $relQuery->orderBy('scenes.sort_order','asc');
                    } else {
                        $relQuery->orderBy('scenes.shoot_sort_order','asc');
                    }
                } else {
                    $relQuery->orderBy('scenes.sort_order','asc');
                }

                if( !empty($request['shot_list_id']) ){
                    $relQuery->where('scenes.shot_list_id',$request['shot_list_id']);
                }
            }])
            ->join('scenes','scenes.event_id','=','events.id');

        if( !empty($request['shot_list_id']) ){
            $query->where('shot_list_id',$request['shot_list_id']);
        }

        if( !empty($request['keyword']) ){
            $keyword = $request['keyword'];
            $query->where( function($where) use ($keyword){
                $where->orWhere('scenes.title','like',"%$keyword%");
                $where->orWhere('scenes.description','like',"%$keyword%");
            });
        }

        if( !empty($slug) ){
            $query->where('scenes.slug',$slug);
        }

        $query = $query->groupBy('events.id')->orderBy('date','asc')->take(50)->get();
        return $query;
    }

    public static function createScene($request,$postdata)
    {
        $getSortorder = self::getMaxSortOrder($request['shot_list_id']);
        if( !empty($postdata['image_url']) ){
            $postdata['image_url'] = CustomHelper::uploadMedia('scene',$postdata['image_url']);
        }
        if( empty($getSortorder->total_scene) ){
            $scene_no = ($getSortorder->total_scene + 1);
        } else {
            $data     = json_decode(file_get_contents(public_path($request->shot_list_id . '_scene_no.json')),true);
            $scene_no = ($data['last_scene_no'] + 1);
        }
        $postdata['scene_no']   = $scene_no;
        $postdata['sort_order'] = ($getSortorder->sort_order + 1);
        $postdata['shoot_sort_order'] = ($getSortorder->shoot_sort_order + 1);
        $postdata['user_id']    = $request['user']->id;
        $postdata['slug']       = time() . uniqid();
        $postdata['created_at'] = Carbon::now();

        //create scene
        $record = self::create($postdata->toArray());

        //update shotlist scene number
        \DB::table('shot_list')->where('id',$record->shot_list_id)->increment('total_scene',1);
        $data = [
            'last_scene_no' => $record->scene_no
        ];
        file_put_contents(public_path($record->shot_list_id . '_scene_no.json'),json_encode($data));

        //get event scenes
        $params = [
            'shot_list_id' => $record->shot_list_id
        ];
        //$record = self::getEventScenes($params);
        return $record;
    }

    public static function updateScene($request,$postData,$slug)
    {
        if( !empty($postData['image_url']) ){
            $postData['image_url'] = CustomHelper::uploadMedia('scene',$postData['image_url']);
        }
        $postData['updated_at'] = Carbon::now();

        self::where('slug',$slug)->update($postData->toArray());

        $params = [
            'shot_list_id' => $request->shot_list_id
        ];
        //$record = self::getEventScenes($params);

        $record = self::where('slug',$slug)->first();
        return $record;
    }
}
