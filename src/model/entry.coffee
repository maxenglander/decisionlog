class Entry
    constructor: (@id, @question, @answer, @createdAt) ->
    getAnswer: -> return @answer
    getCreatedAt: -> return @createdAt
    getId: -> return @id
    getQuestion: -> return @question

export = Entry
