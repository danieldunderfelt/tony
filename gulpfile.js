var gulp = require('gulp');
var browserSync = require('browser-sync');

gulp.task('browser-sync', function() {
    browserSync({
        proxy: "house.dev",
        open: false,
        notify: false,
        ghostMode: false
    });
});

gulp.task('bs-reload', function () {
    browserSync.reload();
});

// Default task to be run with `gulp`
gulp.task('default', ['browser-sync'], function () {
    gulp.watch("src/js/**/*.js", ['browserify']);
    gulp.watch("src/scss/**/*.scss", ['sass']);
    gulp.watch("build/*.html", ['bs-reload']);
});