module.exports = (grunt) ->
    grunt.loadNpmTasks 'grunt-es6-module-transpiler'
    grunt.loadNpmTasks 'grunt-simple-mocha'

    grunt.initConfig
        pkg: grunt.file.readJSON('package.json'),
        simplemocha:
            options:
                compilers: 'coffee:coffee-script'
                ui: 'bdd'
            all:
                src: [
                    'build/<%=module_type%>/lib/**/*.coffee',
                    'build/<%=module_type%>/spec/**/*.coffee'
                ]
        transpile:
            main:
                type: '<%=module_type%>'
                files: [ {
                    expand: true,
                    cwd: 'src/',
                    src: [ '**/*.coffee' ],
                    dest: 'build/<%=module_type%>/lib'
                }, {
                    expand: true,
                    cwd: 'spec/',
                    src: [ '**/*.coffee' ],
                    dest: 'build/<%=module_type%>/spec'
                } ]

    grunt.registerTask 'build', "Build", (module_type) ->
        grunt.config.set('module_type', module_type)
        grunt.task.run 'transpile'
        
    grunt.registerTask 'test', "Test", ->
        grunt.task.run 'build:cjs'
        grunt.task.run 'simplemocha'
