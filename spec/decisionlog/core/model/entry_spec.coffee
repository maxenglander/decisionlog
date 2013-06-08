import { Entry } from "./entry"
import "assert" as assert

describe 'Entry', ->
    expectedId = 1
    expectedLogId = 2
    expectedQuestion = "To be or not to be?"
    expectedAnswer = "That is the question"
    expectedState = 'resolved'
    entry = null

    beforeEach ->
        entry = new Entry(expectedId, expectedLogId, expectedQuestion, expectedAnswer, expectedState)

    describe '#getAnswer', ->
        it "returns the answer", ->
            assert.equal(expectedAnswer, entry.getAnswer())

    describe '#getId', ->
        it "returns the id", ->
            assert.equal(expectedId, entry.getId())

    describe '#getLogId', ->
        it "returns the log id", ->
            assert.equal(expectedLogId, entry.getLogId())

    describe '#getQuestion', ->
        it "returns the question", ->
            assert.equal(expectedQuestion, entry.getQuestion())

    describe '#getState',  ->
        it "returns the state", ->
            assert.equal(expectedState, entry.getState())
