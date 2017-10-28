// My variables
var input = {
    'js'      : 'app/assets/javascripts/',
    'scss'    : 'app/assets/scss/'
}

var output = {
    'base': 'app/assets/',
    'css' : 'app/assets/stylesheets/common',
    'js'  : 'app/assets/javascripts/',
    'html': 'templates/'
}

var gulp           = require('gulp'),
    autoprefixer   = require('autoprefixer');
    browser_sync   = require('browser-sync'),
    concat         = require('gulp-concat'),
    notify         = require("gulp-notify"),
    nunjucksRender = require('gulp-nunjucks-render'),
    postcss        = require('gulp-postcss'),
    sass           = require('gulp-sass'),
    sourcemaps     = require('gulp-sourcemaps'),
    reload         = browser_sync.reload,
    fs             = require('fs');


    // gulp.task('reload', function() {
    //   return browser_sync.reload();
    // });
    //
    // gulp.task('reloadCSS', function() {
    //   return browser_sync.reload('*.css');
    // });
    //
    // var setupWatchers = function() {
    //   gulp.watch([
    //     './app/views/**/*.erb', './app/assets/javascripts/**/*.js'
    //   ], gulp.series('reload'));
    //   gulp.watch(['./app/assets/scss/**/*.scss'], gulp.series('reloadCSS'));
    // };
    //
    // // Browser-sync
    // gulp.task('browser_sync', function() {
    //   var files = [
    //     //'templates/*.html',
    //     'app/assets/stylesheets/**/*.css',
    //     'app/assets/javascript/**/*.js',
    //     'app/views/**/*.erb'
    //   ];
    //   browser_sync.init(files, {
    //     proxy: 'localhost:3000',
    //     port: 8000,
    //     open: false,
    //     ui: {
    //       port: 8001
    //     }
    //   });
    //   setupWatchers();
    // });

// Browser-sync
gulp.task('browser_sync', function () {
    var files = [
        output.html + '/**/*.html',
        output.css + '*.css',
        output.js + '*.js'
    ];

    browser_sync.init(files, {
        server: {
            baseDir: output.html
        },
        port: 3003,
        reloadDebounce: 2000
    });

});

gulp.task('nunjucks', function(done) {
  //nunjucksRender.nunjucks.configure(['templates-dev']);
  // Gets .html and .nunjucks files in pages
  return gulp.src('templates-dev/**/*.+(html|nunjucks)')
  // Renders template with nunjucks
  .pipe(nunjucksRender({
    path: ['templates-dev/']
  }))
  .on('error', notify.onError(function(error) {
    return "Problem in file: " + error.message;
  }))
  // output files in app folder
  .pipe(gulp.dest(output.html))
  .pipe(browser_sync.stream());
  done();
});

// SCSS
gulp.task('sass', function(done){
    gulp.src(input.scss + '*.scss')
    // .pipe(sourcemaps.init())
    .pipe(sass({
        sourcemap: true,
        outputStyle: 'expanded',
    }).on('error', notify.onError(function(error) {
        return "Problem in file: " + error.message;
    })))
    .pipe(sourcemaps.write())
    .pipe(postcss([ autoprefixer({ browsers: ['> 1%', 'safari 8', 'last 2 versions', 'android 4'] }) ]))
    .pipe(gulp.dest(output.css))
    .pipe(browser_sync.stream());
    done();
});


//Watch
gulp.task('watch', function (){
    gulp.watch(input.scss + '**/*.scss', gulp.series('sass'));
    gulp.watch('templates-dev/**/*.+(html|nunjucks)', gulp.series('nunjucks'));
    //gulp.watch('public/javascripts/**/*.js', gulp.series('js-prod', 'js-seo'));
});

gulp.task('default', gulp.parallel('sass', 'watch', 'browser_sync'), function() {
  gulp.series(browser_sync.reload);
});
