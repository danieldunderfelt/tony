var sass = require('gulp-sass');
var browserSync = require('browser-sync').reload;

module.exports = gulp.task('sass', function () {
    return gulp.src('src/scss/*.scss')
        .pipe(sass())
        .pipe(gulp.dest('./build/css'))
        .pipe(reload({stream: true}));
});