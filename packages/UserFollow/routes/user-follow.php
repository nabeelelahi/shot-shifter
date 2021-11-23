<?php

use Illuminate\Support\Facades\Route;
use Retrocube\UserFollow\Http\Controllers\UserFollowController;

Route::prefix('api')->group(function () {

    Route::middleware(['api_authorization','api'])->group(function(){
        Route::middleware(['custom_auth:api'])->group(function(){
            Route::resource('user-follow',UserFollowController::class);
        });
    });

});
