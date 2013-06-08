module.exports = (grunt) ->
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-es6-module-transpiler'
    grunt.loadNpmTasks 'grunt-simple-mocha'

    grunt.initConfig
        clean:
            compile: 'build/'
            release: 'lib/'
        coffee:
            options:
                bare: true
            all:
                expand: true,
                cwd: 'build/coffee',
                src: [ '**/*.coffee' ],
                dest: 'build/js/',
                ext: '.js',
        copy:
            release:
                files: [ {
                    expand: true,
                    cwd: 'build/js',
                    src: [ '**/*.js', '!**/*_spec.js' ]
                    dest: 'lib/'
                } ]
        simplemocha:
            options:
                ui: 'bdd'
            all:
                src: [
                    'build/js/**/*.js',
                ]
        transpile:
            all:
                type: 'cjs'
                files: [ {
                    expand: true,
                    cwd: 'src/',
                    src: [ '**/*.coffee' ],
                    dest: 'build/coffee'
                }, {
                    expand: true,
                    cwd: 'spec/',
                    src: [ '**/*.coffee' ],
                    dest: 'build/coffee'
                } ]

    grunt.registerTask 'build', [ 'clean', 'transpile', 'coffee' ]
    grunt.registerTask 'release', [ 'clean', 'build', 'copy' ]
    grunt.registerTask 'test', [ 'clean', 'transpile', 'coffee', 'simplemocha' ]
