fs = require 'fs'
spawn = require('child_process').spawn

task 'compile', "Compile all source code", ->
    coffee = spawn 'coffee', [ '-b', '-c', '-o', 'lib/decisionlog/core', 'src' ]
