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
        'lines_dialogue_english', 'lines_dialogue_foreign', 'camera', 'is_complete', 'sort_order', 'status',
        'created_at', 'updated_at', 'deleted_at'
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
        $query = self::selectRaw('IFNULL(MAX(sort_order),0) AS sort_order')
                    ->where('shot_list_id',$shot_list_id)
                    ->first();
        return $query;
    }

    public static function reOrderRecords($params)
    {
        $api_data = [];
        $records = self::where('id', '>=',$params['scene_id'])
                        ->where('sort_order','<=',$params['new_sort_order'])
                        ->get();
        if( count($records) ){
           foreach( $records as $record ){
                $sort_order = $record->id == $params['scene_id'] ? $params['new_sort_order'] : ($record->sort_order - 1);
                $cases[]  = "WHEN {$record->id} then ?";
                $data[]   = $sort_order;
                $ids[]    = $record->id;
                $record->sort_order = $sort_order;
                $api_data[] = $record;
            }
            $ids = implode(',', $ids);
            $cases = implode(' ', $cases);
           \DB::update("UPDATE scenes SET `sort_order` = CASE `id` {$cases} END WHERE `id` in ({$ids})", $data);
        }
        usort($api_data, function($a, $b) {
            return $a['sort_order'] - $b['sort_order'];
        });
        return $api_data;
    }
}
