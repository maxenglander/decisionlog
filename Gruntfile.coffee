module.exports = (grunt) ->
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-es6-module-transpiler'
    grunt.loadNpmTasks 'grunt-requirejs'
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
            cjs:
                files: [ {
                    expand: true,
                    cwd: 'build/js/cjs/',
                    src: [ '**/*.js', '!**/*_spec.js' ]
                    dest: 'lib/'
                } ]
        requirejs:
            compile:
                options:
                    baseUrl: 'build/js/amd/',
                    name: 'decisionlog/core'
                    out: 'decisionlog-core.js'
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
                    src: [ '**/*.coffee' ],
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
    grunt.registerTask 'release', [ 'clean', 'build', 'copy:cjs', 'requirejs' ]
    grunt.registerTask 'test', [ 'build', 'simplemocha' ]
