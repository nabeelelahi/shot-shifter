<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\FaqController;
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

Route::get('get-csrf-token',function(){
    echo csrf_token();
});

Route::middleware(['api_authorization'])->group(function(){

    Route::post('user/login',[UserController::class,'login']);
    Route::post('user/forgot-password',[UserController::class,'forgotPassword']);
    Route::post('user/change-password',[UserController::class,'changePassword']);
    Route::post('user/logout',[UserController::class,'userLogout']);
    Route::post('user/social-login',[UserController::class,'socialLogin']);
    Route::post('user/verify-code',[UserController::class,'verifyCode']);
    Route::post('user/resend-code',[UserController::class,'resendCode']);
    Route::resource('user',UserController::class)->except(['delete']);

    Route::resource('faq',FaqController::class)->only('index');

    Route::middleware(['custom_auth:api'])->group(function(){

        Route::get('notification',[NotificationController::class,'index']);
        Route::put('notification/{any}',[NotificationController::class,'update']);
        Route::post('notification/send',[NotificationController::class,'sendNotification']);
        Route::post('notification/setting',[NotificationController::class,'saveNotificationSetting']);
        Route::get('notification/setting',[NotificationController::class,'getNotificationSetting']);

    });
});
