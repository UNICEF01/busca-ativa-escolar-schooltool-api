<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Intefaces\IAlertResearch;
use App\Services\ResearchAlertService;
use App\Interfaces\IChildren;
use App\Services\ChildrenService;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
        $this->app->bind(IAlertResearch::class, ResearchAlertService::class);
        $this->app->bind(IChildren::class, ChildrenService::class);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
