path = require('path')
module.exports = (grunt) ->
    grunt.registerMultiTask 'wrap', "Wrap files between header and footer", ->
        options = @options()
        grunt.log.writeln "Using header #{options.header}"
        header_contents = grunt.file.read options.header
        grunt.log.writeln "Using footer #{options.footer}"
        footer_contents = grunt.file.read options.footer

        @files.forEach (file) =>
            file_contents = file.src.filter((file_path) ->
                if not grunt.file.exists file_path
                    grunt.log.warn "Source file #{file_path} not found"
                    return false
                else
                    return true
            ).map((file_path) ->
                header_contents + "\n" + grunt.file.read(file_path).replace(/^(.*)$/gm, "    $1") + "\n" + footer_contents
            ).join("\n")

            grunt.file.write file.dest, file_contents
            grunt.log.writeln "Created #{file.dest}"
