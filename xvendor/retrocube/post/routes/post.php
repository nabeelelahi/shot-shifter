<?php

use Illuminate\Support\Facades\Route;
use Retrocube\Post\Http\Controllers\PostController;

Route::prefix('api')->group(function () {

    Route::middleware(['api_authorization','api'])->group(function(){
        Route::middleware(['custom_auth:api'])->group(function(){
            Route::resource('post',PostController::class);
        });
    });

});
