class Entry
    constructor: (@id, @logId, @question, @answer, @state) ->
    getAnswer: -> return @answer
    getId: -> return @id
    getLogId: -> return @logId
    getQuestion: -> return @question
    getState: -> return @state

export Entry
