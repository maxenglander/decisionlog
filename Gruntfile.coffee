module.exports = (grunt) ->
    grunt.loadTasks './tasks'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-simple-mocha'

    grunt.initConfig
        clean:
            build: 'build/'
        coffee:
            options:
                bare: true
            all:
                expand: true,
                cwd: 'build/',
                src: [ '**/*.coffee' ],
                dest: './',
                ext: '.js',
        simplemocha:
            options:
                compilers: {
                    'coffee': 'coffee-script'
                },
                ui: 'bdd'
            all:
                src: [ 'build/**/*.coffee', 'spec/**/*.coffee' ]
        wrap:
            options:
                header: 'umd/begin.frag',
                footer: 'umd/end.frag'
            src:
                expand: true
                cwd: 'src/'
                src: [ '**/*.coffee' ]
                dest: 'build/'

    grunt.registerTask 'build', [ 'wrap', 'coffee' ]
    grunt.registerTask 'release', [ 'clean', 'build' ]
    grunt.registerTask 'test', [ 'build', 'simplemocha' ]
