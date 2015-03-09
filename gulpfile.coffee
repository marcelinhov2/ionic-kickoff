gulp          = require 'gulp'
open          = require 'open'
es            = require 'event-stream'
jade          = require 'gulp-jade'
coffee        = require 'gulp-coffee'
stylus        = require 'gulp-stylus'
sass          = require 'gulp-sass'
concat        = require 'gulp-concat'
uglify        = require 'gulp-uglify'
inject        = require 'gulp-inject'
connect       = require 'gulp-connect'
imagemin      = require 'gulp-imagemin'
bowerFiles    = require 'main-bower-files'
rimraf        = require 'rimraf'
classify      = require 'gulp-ng-classify'
rename        = require "gulp-rename"
templateCache = require 'gulp-angular-templatecache'
runSequence   = require 'run-sequence'

paths =
  index:      'src/index.html'
  fonts:      'src/fonts/**/*'
  images:     'src/images/**/*'
  styles:     'src/styles/**/*.scss'
  base_style: 'src/styles/ionic.app.scss'
  scripts:    'src/scripts/**/*.coffee'
  partials:   'src/partials/**/*.html'

############################## Development ##############################

# Clean development build folder
gulp.task "clean", (cb) ->
  rimraf.sync "./www"
  cb null

gulp.task 'move_bower', ->
  gulp.src './bower_components/**/*'
    .pipe gulp.dest 'www/bower_components'

gulp.task "concat_bower", ->
  gulp.src bowerFiles({
      filter: /\.js$/i,
      paths: {
        bowerDirectory: './bower_components',
      }
    })
    .pipe(concat( 'dependencies.js') )
    .pipe gulp.dest "www/scripts"

# Compile coffee, generate source maps, trigger livereload
gulp.task 'scripts', ->
  gulp.src paths.scripts
    .pipe do classify
    .pipe coffee bare: false
    .pipe gulp.dest 'www/scripts'

#Compile stylus, trigger livereload
gulp.task 'styles', ->
  gulp.src paths.base_style
    .pipe sass()
    .pipe gulp.dest 'www/styles'

gulp.task 'styles:reload', ->
  gulp.src paths.base_style
    .pipe sass()
    .pipe gulp.dest 'www/styles'
    .pipe connect.reload()

#Copy images, trigger livereload
gulp.task 'images', ->
  gulp.src paths.images
    .pipe gulp.dest 'www/images'

# Copy fonts
gulp.task 'fonts', ->
  gulp.src paths.fonts
    .pipe gulp.dest 'www/fonts'

#Compile Jade, trigger livereload
gulp.task 'partials', ->
  gulp.src paths.partials
    .pipe templateCache('templates', {standalone:true, root: '/partials/'} )
    .pipe rename(extname: '.js')
    .pipe gulp.dest 'www/scripts'

#Compile index.jade, inject compiled stylesheets, inject compiled scripts, inject bower packages
gulp.task 'index', ->
  gulp.src paths.index
    .pipe inject(es.merge(
      gulp.src './www/styles/**/*.css', read: no
    ,
      gulp.src './www/scripts/**/*.js', read: no
    ), ignorePath: '/www', addRootSlash: false)
    .pipe gulp.dest 'www/'

gulp.task 'reload', ->
  gulp.src paths.index
    .pipe connect.reload()

# Launch server and open app in default browser
gulp.task 'server', ['compile', 'watch'], ->
  connect.server
    port       : 1337
    root       : 'www'
    livereload : yes
    fallback   : 'www/index.html'

  open 'http://localhost:1337'

# Register tasks
gulp.task 'watch', ->
  gulp.watch paths.partials , ['compile']
  gulp.watch paths.scripts  , ['compile']
  gulp.watch paths.styles   , ['styles:reload']
  gulp.watch paths.images   , ['compile']
  gulp.watch paths.index    , ['compile']

gulp.task 'compile', ['clean'], (cb) ->
  runSequence(
    'move_bower', 
    'concat_bower', 
    [
      'scripts', 
      'styles', 
      'images', 
      'fonts'
    ], 
    'partials',
    'index', 
    'reload', 
    cb
  );

gulp.task 'default' , ['server']