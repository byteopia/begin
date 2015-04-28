browserSync   = require 'browser-sync'
browserReload = browserSync.reload

browserify  = require 'gulp-browserify'

gulp        = require 'gulp'
plumber     = require 'gulp-plumber'
del         = require 'del'

# assets 
watch       = require 'gulp-watch'
concat      = require 'gulp-concat'
sass        = require 'gulp-ruby-sass'
minifyCss   = require 'gulp-minify-css'
cssGlobbing = require 'gulp-css-globbing'
minifyHtml  = require 'gulp-minify-html'
bowerFiles  = require 'main-bower-files'

# dist
usemin      = require 'gulp-usemin'
wiredep     = require( 'wiredep' ).stream
rev         = require 'gulp-rev'
revDel      = require 'rev-del'
uglify      = require 'gulp-uglifyjs'

config =
  app:       "app"
  styles:    "app/styles" 
  scripts:   "app/scripts"
  templates: "app/templates"

  build:     "build"

  dist:      "dist"


# clean a directory
doClean = (what) ->
  (cb) -> 
    cb( del( what ) )

gulp.task 'clean:build', doClean( "#{config.build}/*" )
gulp.task 'clean:dist',  doClean( "#{config.dist}/*" )
gulp.task 'clean:dist:post', [ 'usemin' ], doClean( [ "#{config.dist}/app.js", "#{config.dist}/app.css" ] )

# copy stuff
doCopy = (what, towhat) ->
  ->
    stream = gulp.src [ "#{what}/*.*" ]
      .pipe gulp.dest( towhat )
    
    stream

gulp.task 'copy:dist', doCopy( "#{config.build}", config.dist )


# styles
gulp.task 'styles', ->
  bscss = bowerFiles([['**/*.css']])

  stream = sass "#{config.styles}/app.scss",
    require: [ 'sass-globbing', 'susy' ]
    loadPath: [ bscss, config.styles ]
  .pipe plumber()
  .pipe gulp.dest( config.build )
  .pipe browserReload
    stream:true

  stream


## scripts
gulp.task 'scripts', ->
  stream = gulp.src "#{config.scripts}/app.coffee", read: false
    .pipe plumber()
    .pipe browserify
      transform: [ 'coffeeify', 'aliasify', 'hoganify' ]
    .pipe concat( 'app.js' )
    .pipe gulp.dest( config.build )
    .pipe browserReload
      stream: true
  
  stream


## inject resources automatically. this takes care of moving as well
gulp.task 'bower', [ 'clean:build', 'scripts', 'styles' ], ->
  stream = gulp.src "#{config.app}/index.html"
    .pipe wiredep
      exclude: [ /backbone/, /underscore/, /marionette/ ]
    .pipe gulp.dest( config.build )

  stream



# optimize injected files
gulp.task 'usemin', [ 'copy:dist' ], ->
  stream = gulp.src "#{config.dist}/index.html"
    .pipe usemin
      js: [ uglify(), rev() ]
      css: [ 'concat', minifyCss(), rev() ]
      html: [ minifyHtml() ]
    .pipe gulp.dest( config.dist )
 
  stream


# start a server
gulp.task 'server', [ 'bower' ], ->
  browserSync
    notify: false
    port: 9000
    open: false
    ui: false
    server:
      baseDir: [ config.build ]
      routes:
        '/bower_components': 'bower_components'

  gulp.watch( [ "#{config.app}/*.html" ], { cwd: config.build }, browserReload )
  gulp.watch( [ "#{config.styles}/app.scss", "#{config.styles}/**/*.scss" ], [ 'styles' ] )
  gulp.watch( [ "#{config.scripts}/app.coffee", "#{config.scripts}/**/*.coffee" ], [ 'scripts' ] )


# build
gulp.task 'build', [ 'server' ]

# distribute
#
# https://github.com/gulpjs/gulp/issues/426#issuecomment-41208360
gulp.task 'dist', [ 'clean:dist', 'build' ], ->
  gulp.start [ 'copy:dist', 'usemin', 'clean:dist:post' ]
