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


paths =
  index:     'src/index.jade'
  fonts:     'src/fonts/**/*'
  images:    'src/images/**/*'
  styles:    'src/styles/ionic.app.scss'
  scripts:   'src/scripts/**/*.coffee'
  partials:  'src/partials/**/*.jade'



############################## Development ##############################


# Compile coffee, generate source maps, trigger livereload
gulp.task 'scripts', ['move_bower', 'partials'], (cb) ->
  gulp.src paths.scripts
    .pipe do classify
    .pipe coffee bare: false
    .pipe gulp.dest 'www/scripts'
    .pipe connect.reload()

  cb null

gulp.task 'move_bower', (cb) ->
  gulp.src './bower_components/**/*'
    .pipe gulp.dest 'www/bower_components'

  cb null

#Compile stylus, trigger livereload
gulp.task 'styles', ->
  gulp.src paths.styles
    .pipe sass()
    .pipe gulp.dest 'www/styles'
    .pipe connect.reload()

#Copy images, trigger livereload
gulp.task 'images', ->
  gulp.src paths.images
    .pipe gulp.dest 'www/images'
    .pipe connect.reload()

# Copy fonts
gulp.task 'fonts', ->
  gulp.src paths.fonts
    .pipe gulp.dest 'www/fonts'

#Compile Jade, trigger livereload
gulp.task 'partials', (cb) ->
  gulp.src paths.partials
    .pipe jade pretty: yes
    .pipe templateCache('templates', {standalone:true, root: '/partials/'} )
    .pipe rename(extname: '.js')
    .pipe gulp.dest 'www/scripts'
    .pipe connect.reload()

  cb null

#Compile index.jade, inject compiled stylesheets, inject compiled scripts, inject bower packages
gulp.task 'index', ['clean', 'partials', 'scripts', 'concat_bower', 'styles', 'images', 'fonts'], ->
  gulp.src paths.index
    .pipe jade pretty: yes
    .pipe inject(es.merge(
      gulp.src './www/styles/**/*.css', read: no
    ,
      gulp.src './www/scripts/**/*.js', read: no
    ), ignorePath: '/www', addRootSlash: false)
    .pipe gulp.dest 'www/'
    .pipe connect.reload()

gulp.task "concat_bower", ->
  gulp.src bowerFiles({
      filter: /\.js$/i,
      paths: {
        bowerDirectory: './bower_components',
      }
    })
    .pipe(concat( 'dependencies.js') )
    .pipe gulp.dest "www/scripts"

# Clean development build folder
gulp.task "clean", (cb) ->
  rimraf.sync "./www"
  cb null

# Register tasks
gulp.task 'watch', ->
  gulp.watch paths.partials , ['partials']
  gulp.watch paths.scripts  , ['scripts']
  gulp.watch paths.styles   , ['styles']
  gulp.watch paths.images   , ['images']
  gulp.watch paths.index    , ['index']


############################## Build ##############################


# Compile coffee, generate source maps, trigger livereload
gulp.task 'scripts:prod', ['move_bower:prod', 'partials:prod'], ->
  gulp.src paths.scripts
    .pipe do classify
    .pipe coffee bare: false
    .pipe concat 'main.js'
    .pipe do uglify
    .pipe gulp.dest 'www/scripts'

gulp.task 'move_bower:prod', (cb) ->
  gulp.src './bower_components/**/*'
    .pipe gulp.dest 'www/bower_components'

#Compile stylus, trigger livereload
gulp.task 'styles:prod', ->
  gulp.src paths.styles
    .pipe sass()
    .pipe gulp.dest 'www/styles'

#Copy images, trigger livereload
gulp.task 'images:prod', ->
  gulp.src paths.images
    .pipe do imagemin
    .pipe gulp.dest 'www/images'

# Copy fonts
gulp.task 'fonts:prod', ->
  gulp.src paths.fonts
    .pipe gulp.dest 'www/fonts'

#Compile Jade, trigger livereload
gulp.task 'partials:prod', (cb) ->
  gulp.src paths.partials
    .pipe do jade
    .pipe templateCache('templates', {standalone:true, root: '/partials/'} )
    .pipe rename(extname: '.js')
    .pipe do uglify
    .pipe gulp.dest 'www/scripts'

  cb null

#Compile index.jade, inject compiled stylesheets, inject compiled scripts, inject bower packages
gulp.task 'index:prod', ['clean:prod', 'scripts:prod', 'concat_bower:prod', 'styles:prod', 'partials:prod', 'images:prod', 'fonts:prod'], ->
  gulp.src paths.index
    .pipe do jade
    .pipe inject(es.merge(
      gulp.src './www/styles/**/*.css', read: no
    ,
      gulp.src './www/scripts/**/*.js', read: no
    ), ignorePath: ['/www'], addRootSlash: false)
    .pipe gulp.dest 'www/'

gulp.task "concat_bower:prod", ->
  gulp.src bowerFiles({
      filter: /\.js$/i,
      paths: {
        bowerDirectory: './bower_components',
      }
    })
    .pipe(concat( 'dependencies.js') )
    .pipe do uglify
    .pipe gulp.dest "www/scripts"

# Launch server and open app in default browser
gulp.task 'server', ['compile', 'watch'], ->
  connect.server
    port       : 1337
    root       : 'www'
    livereload : yes
    fallback   : 'www/index.html'

  open 'http://localhost:1337'

# Clean development build folder
gulp.task "clean:prod", (cb) ->
  rimraf.sync "./www"
  cb null

gulp.task 'build'   , ['scripts:prod', 'styles:prod', 'images:prod', 'fonts:prod', 'index:prod']
gulp.task 'compile' , ['scripts', 'styles', 'images', 'fonts', 'index']
gulp.task 'default' , ['watch']
