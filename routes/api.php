<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\FaqController;
use App\Http\Controllers\Api\ShotListController;
use App\Http\Controllers\Api\SceneController;
use App\Http\Controllers\Api\BreaksController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Api\UserMemberShotListController;
use App\Http\Controllers\Api\UserMemberController;
use App\Http\Controllers\Api\UserSubscriptionController;
use App\Http\Controllers\Api\EventController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::middleware(['api_authorization'])->group(function(){

    Route::post('user/login',[UserController::class,'login']);
    Route::post('user/forgot-password',[UserController::class,'forgotPassword']);
    Route::post('user/change-password',[UserController::class,'changePassword']);
    Route::post('user/logout',[UserController::class,'userLogout']);
    Route::post('user/social-login',[UserController::class,'socialLogin']);
    Route::post('user/verify-code',[UserController::class,'verifyCode']);
    Route::post('user/resend-code',[UserController::class,'resendCode']);
    Route::resource('user',UserController::class)->except(['destroy']);

    Route::resource('faq',FaqController::class)->only('index');

    Route::middleware(['custom_auth:api'])->group(function(){

        Route::get('shot-list/export',[ShotListController::class,'getPdf']);
        Route::resource('shot-list',ShotListController::class);
        Route::post('scene/complete',[SceneController::class, 'sceneComplete']);
        Route::post('scene/reorder',[SceneController::class, 'reOrderRecord']);
        Route::resource('scene', SceneController::class);
        Route::resource('break', BreaksController::class)->only(['store','destroy']);
        Route::resource('member',UserMemberShotListController::class)->only(['index','store','destroy']);
        Route::resource('team', UserMemberController::class)->only(['index','store']);

        Route::resource('event',EventController::class);

        Route::get('notification',[NotificationController::class,'index']);
        Route::put('notification/{any}',[NotificationController::class,'update']);
        Route::post('notification/send',[NotificationController::class,'sendNotification']);
        Route::post('notification/setting',[NotificationController::class,'saveNotificationSetting']);
        Route::get('notification/setting',[NotificationController::class,'getNotificationSetting']);

        Route::post('user-subscription',[UserSubscriptionController::class,'store']);

    });

    Route::post('truncate-data',[HomeController::class, 'truncateData']);
});
