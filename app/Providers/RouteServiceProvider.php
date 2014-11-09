<?php namespace Dunderfelt\Tony\Providers;

use Illuminate\Routing\Router;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;

class RouteServiceProvider extends ServiceProvider {

	/**
	 * All of the application's route middleware keys.
	 *
	 * @var array
	 */
	protected $middleware = [
		'auth' => 'Dunderfelt\Tony\Http\Middleware\Authenticated',
		'auth.basic' => 'Dunderfelt\Tony\Http\Middleware\AuthenticatedWithBasicAuth',
		'guest' => 'Dunderfelt\Tony\Http\Middleware\IsGuest'
	];

	/**
	 * Called before routes are registered.
	 *
	 * Register any model bindings or pattern based filters.
	 *
	 * @param  \Illuminate\Routing\Router  $router
	 * @return void
	 */
	public function before(Router $router)
	{
        $router->pattern('slug', '[a-zA-Z0-9-_]+');
	}

	/**
	 * Define the routes for the application.
	 *
	 * @param  \Illuminate\Routing\Router  $router
	 * @return void
	 */
	public function map(Router $router)
	{
		$router->group(['namespace' => 'Dunderfelt\Tony\Http\Controllers'], function($router)
		{
			require app_path('Http/routes.php');
		});
	}

}
