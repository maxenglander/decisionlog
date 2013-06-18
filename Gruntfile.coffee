module.exports = (grunt) ->
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-es6-module-transpiler'
    grunt.loadNpmTasks 'grunt-simple-mocha'

    grunt.initConfig
        clean:
            build: 'build/'
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
            all:
                files: [ {
                    expand: true,
                    cwd: 'build/js/',
                    src: [ '**/*.js', '!**/*_spec.js' ]
                    dest: 'dist/'
                } ]
        simplemocha:
            options:
                compilers: {
                    'coffee': 'coffee-script'
                },
                ui: 'bdd'
            all:
                src: [
                    'build/coffee/cjs/**/*.coffee',
                ]
        transpile:
            amd:
                type: 'amd',
                files: [ {
                    expand: true,
                    cwd: 'src/',
                    src: [ '**/*.coffee', '!**/index.coffee' ],
                    dest: 'build/coffee/amd/'
                } ]
            cjs:
                type: 'cjs'
                files: [ {
                    expand: true,
                    cwd: 'src/',
                    src: [ '**/*.coffee' ],
                    dest: 'build/coffee/cjs/'
                }, {
                    expand: true,
                    cwd: 'spec/',
                    src: [ '**/*.coffee' ],
                    dest: 'build/coffee/cjs/'
                } ]

    grunt.registerTask 'build', [ 'transpile', 'coffee' ]
    grunt.registerTask 'release', [ 'clean', 'build', 'copy' ]
    grunt.registerTask 'test', [ 'build', 'simplemocha' ]
