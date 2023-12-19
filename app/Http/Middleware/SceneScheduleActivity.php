<?php

namespace App\Http\Middleware;

use App\Models\ScheduleActivity;
use Carbon\Carbon;
use Closure;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

class SceneScheduleActivity
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $old_record = NULL;
        $route_name = Route::currentRouteName();
        if( $route_name == 'scene.update' ){
            $route_params = $request->route()->parameters();
            $slug = $route_params['scene'];
            $old_record = \DB::table('scenes')->where('slug',$slug)->first();
            $old_record = json_encode($old_record);
        }
        $response = $next($request);
        try{
            //save activity
            $data = $response->getData();
            if( $data->code == 200 && strtolower($request->method()) != 'get' ){
                if( $route_name == 'scene.store' ){
                    ScheduleActivity::sceneCreateActivity($request,$response);
                }
                if( $route_name == 'scene.update' ){
                    ScheduleActivity::sceneUpdateActivity($request,$response,$old_record);
                }
                if( $route_name == 'scene.destroy' ){
                    ScheduleActivity::sceneDeleteActivity($request,$response);
                }
                if($route_name == 'scene.completed'){
                    ScheduleActivity::sceneCompletedActivity($request,$response);
                }
                if($route_name == 'scene.reorder'){
                    ScheduleActivity::sceneReOrderActivity($request,$response);
                }
            }
        } catch ( \Exception $e ){

        }
        //return response
        return $response;
    }
}
