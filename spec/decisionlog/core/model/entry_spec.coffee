import { Entry } from "./entry"
import "assert" as assert

describe 'Entry', ->
    describe '#getAnswer', ->
        expectedId = 1
        expectedQuestion = "To be or not to be?"
        expectedAnswer = "That is the question"
        expectedState = 'resolved'
        entry = new Entry(expectedId, expectedQuestion, expectedAnswer, expectedState)

        it "returns the answer", ->
            assert.equal(expectedAnswer, entry.getAnswer())
