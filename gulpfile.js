var gulp = require('gulp');
var browserify = require('browserify');
var browserSync = require('browser-sync');
var sass = require('gulp-sass');
var transform = require('vinyl-transform');
var notify = require("gulp-notify");
var sourcemaps = require('gulp-sourcemaps');
var autoprefixer = require('gulp-autoprefixer');
var filter = require('gulp-filter');
var imagemin = require('gulp-imagemin');
var changed = require('gulp-changed');

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

gulp.task('images', function () {
    return gulp.src('resources/assets/img/**/*.{jpg,png}')
        .pipe(changed('public/assets/img'))
        .pipe(imagemin())
        .pipe(gulp.dest('public/assets/img'))
        .pipe(browserSync.reload({stream: true}));
});

gulp.task('browserify', function(){

    var browserified = transform(function(filename) {
        return browserify(filename, { debug: true})
            .bundle();
    }).on('error', handleErrors);

    return gulp.src(['resources/assets/js/index.js'])
        .pipe(browserified)
        .on('error', handleErrors)
        .pipe(gulp.dest('public/assets/js'))
        .pipe(browserSync.reload({stream: true}));
});

gulp.task('sass', function () {
    return gulp.src('resources/assets/scss/*.scss')
        .pipe(sass({ errLogToConsole: true }))
        .pipe(autoprefixer())
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
    gulp.watch("resources/assets/img/**/*.{jpg,png}", ['images']);
    gulp.watch(["app/**/*.php", "resources/views/**/*.php"], ['bs-reload']);
});