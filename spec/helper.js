var requirejs = require('requirejs');
requirejs.config({ 
    nodeRequire: require,
    paths: {
        "decisionlog/core": __dirname + "/../lib/decisionlog/core"
    }
})

global.define = require('amdefine')(module);
global.requirejs = requirejs;
