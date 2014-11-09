<?php namespace Dunderfelt\Tony\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Contracts\View\Factory as ViewFactory;

class AppServiceProvider extends ServiceProvider {

    /**
     * Bootstrap any application services.
     *
     * @param ViewFactory $view
     * @return void
     */
	public function boot(ViewFactory $view)
	{
		$view->composer('partials.header', 'Dunderfelt\Tony\ViewComposers\NavComposer');
		$view->composer('modules.news', 'Dunderfelt\Tony\ViewComposers\NewsModuleComposer');

        \App::bind('Dunderfelt\Tony\Contracts\ContentRepository', 'Dunderfelt\Tony\Repositories\EloquentContentRepository');
    }

	/**
	 * Register any application services.
	 *
	 * @return void
	 */
	public function register()
	{
		//
	}

}
