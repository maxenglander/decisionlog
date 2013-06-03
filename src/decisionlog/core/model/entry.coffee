class Entry
    constructor: (@id, @question, @answer, @state) ->
    getAnswer: -> return @answer
    getId: -> return @id
    getQuestion: -> return @question

export Entry
