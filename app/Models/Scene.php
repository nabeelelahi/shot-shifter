<?php
namespace App\Models;

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
        'shot_list_id', 'size', 'title', 'slug', 'image_url', 'description', 'angle', 'lens', 'internal_external',
        'sun_time', 'location', 'location_pin', 'cast', 'wardrobe', 'props', 'action', 'speed', 'sound', 'timepicker',
        'grip','lines_dialogue_english', 'lines_dialogue_foreign', 'camera', 'is_complete', 'sort_order', 'scene_no',
        'status', 'created_at', 'updated_at', 'deleted_at'
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
        $getScene = self::with(['shotList','breaks'])
                        ->select('scenes.*')
                        ->where('id',$params['scene_id'])
                        ->first();

        return $getScene;
    }

    public static function getMaxSortOrder($shot_list_id)
    {
        $query = self::selectRaw('IFNULL(MAX(sort_order),0) AS sort_order, COUNT(*) AS total_scene')
                    ->where('shot_list_id',$shot_list_id)
                    ->first();
        return $query;
    }

    public static function reOrderRecords($params)
    {
        $api_data = [];
        $sort_order_index = $params['old_sort_order'] > $params['new_sort_order'] ? $params['new_sort_order'] : $params['old_sort_order'];
        $subtract_index   = $params['old_sort_order'] > $params['new_sort_order'] ? true : false;
        $max_index        = $params['old_sort_order'] > $params['new_sort_order'] ? $params['old_sort_order'] : $params['new_sort_order'];

        $records = self::with(['shotList','breaks'])
                        ->where('shot_list_id',$params['shot_list_id'])
                        ->whereBetween('sort_order',[$sort_order_index,$max_index])
                        ->orderBy('sort_order','asc')
                        ->get();

         if( count($records) ){
           foreach( $records as $record ){
                if( $record->id == $params['scene_id'] ){
                    $sort_order = $params['new_sort_order'];
                } else {
                    $sort_order = $subtract_index ? ($record->sort_order + 1) : ($record->sort_order - 1);
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
           \DB::update("UPDATE scenes SET `sort_order` = CASE `id` {$cases} END WHERE `id` in ({$ids})", $data);
        }
        $sorted = collect($api_data)->sortBy('sort_order');

        return $sorted;
    }
}
