)(
    if typeof define is 'function' and define.amd?
        define
    else
        (ids, factory) ->
            deps = ids.map (id) -> require(id)
            module.exports = factory.apply null, deps
)
