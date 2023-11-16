<?php

namespace App\Http\Middleware;

use App\Models\ScheduleActivity;
use Carbon\Carbon;
use Closure;
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
        $route_name = Route::currentRouteName();
        $response = $next($request);
        //save activity
        $data = $response->getData();
        if( $data->code == 200 && strtolower($request->method()) != 'get' ){
            if( in_array($route_name,['scene.store','scene.update']) ){
                ScheduleActivity::sceneCreateActivity($request,$response);
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
        //return response
        return $response;
    }
}
