# gruntjs.com
module.exports = (grunt) ->
  require('matchdep').filter('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.initConfig
    sass:
      dist:
        options:
          style: 'compressed'
        files:
          'dist/css/style.min.css': 'lib/scss/style.scss'

    autoprefixer:
      options:
        browsers: ['last 2 versions', 'ie 9']
      styles:
        src: 'dist/css/style.min.css'
        dest: 'dist/css/style.min.css'


    watch:
      options:
        livereload: 35729
      styles:
        files: 'lib/scss/*.scss'
        tasks: ['sass', 'autoprefixer']
        livereload: true

  grunt.registerTask 'default', ['sass', 'autoprefixer']
