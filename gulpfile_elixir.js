var elixir = require('laravel-elixir');
require('laravel-elixir-browserify');
require('laravel-elixir-browser-sync');

/*
 |----------------------------------------------------------------
 | Have a Drink!
 |----------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic
 | Gulp tasks for your Laravel application. Elixir supports
 | several common CSS, JavaScript and even testing tools!
 |
 */

elixir(function(mix) {
    mix.browserSync([
            "public/assets/**/*",
            "resources/views/**/*",
            "app/**/*"
        ], {
            proxy: "tony.dev"
        })
        .sass("tony.scss")
        .browserify("index.js", "public/assets/js")
        .routes()
        .events();
});
