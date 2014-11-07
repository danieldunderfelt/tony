var gulp = require('gulp');
var browserify = require('browserify');
var browserSync = require('browser-sync');
var sass = require('gulp-sass');
var transform = require('vinyl-transform');
var notify = require("gulp-notify");
var sourcemaps = require('gulp-sourcemaps');
var autoprefixer = require('gulp-autoprefixer');
var filter = require('gulp-filter');

var handleErrors = function() {

    var args = Array.prototype.slice.call(arguments);

    notify.onError({
        title: "Compile Error",
        message: "<%= error.message %>"
    }).apply(this, args);

    this.emit('end');
};

gulp.task('browser-sync', function() {
    browserSync({
        proxy: "tony.dev",
        open: false,
        notify: false,
        ghostMode: false
    });
});

gulp.task('browserify', function(){

    var browserified = transform(function(filename) {
        return browserify(filename)
            .bundle()
    }).on('error', handleErrors);

    return gulp.src(['resources/assets/js/index.js'])
        .pipe(browserified)
        .on('error', handleErrors)
        .pipe(gulp.dest('public/assets/js'))
        .on('error', handleErrors)
        .pipe(browserSync.reload({stream: true}));
});

gulp.task('sass', function () {
    return gulp.src('resources/assets/scss/*.scss')
        .pipe(sourcemaps.init())
        .pipe(sass())
        .pipe(autoprefixer())
        .pipe(sourcemaps.write())
        .pipe(gulp.dest('public/assets/css'))
        .pipe(filter('**/*.css'))
        .pipe(browserSync.reload({stream: true}));
});

gulp.task('bs-reload', function () {
    browserSync.reload();
});

gulp.task('default', ['browser-sync'], function () {
    gulp.watch("resources/assets/js/**/*.js", ['browserify']);
    gulp.watch("resources/assets/scss/**/*.scss", ['sass']);
    gulp.watch(".app/**/*.php", ['bs-reload']);
    gulp.watch('gulpfile.js', ['default']);
});