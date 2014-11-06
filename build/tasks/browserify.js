var browserify = require('browserify');
var transform = require('vinyl-transform');
var notify = require("gulp-notify");
var reload = require('browser-sync').reload;

var handleErrors = function() {

    var args = Array.prototype.slice.call(arguments);

    notify.onError({
        title: "Compile Error",
        message: "<%= error.message %>"
    }).apply(this, args);

    this.emit('end');
};

module.exports = gulp.task('browserify', function(){
    var browserified = transform(function(filename) {
        return browserify(filename)
            .bundle()
    }).on('error', handleErrors);
    return gulp.src(['./src/js/index.js'])
        .pipe(browserified)
        .on('error', handleErrors)
        .pipe(gulp.dest('./build/js'))
        .on('error', handleErrors)
        .pipe(reload({stream: true}));
});