<?php

namespace Retrocube\UserFollow\Providers;

use Illuminate\Support\ServiceProvider;

class UserFollowServiceProvider extends ServiceProvider
{
    public function boot()
    {
        $this->loadRoutesFrom(__DIR__.'/../../routes/user-follow.php');
        $this->loadMigrationsFrom(__DIR__.'/../Database/Migrations');
    }
}
