import "./entry" as Entry
import "assert" as assert

describe 'Entry', ->
    expectedAnswer = "That is the question"
    expectedCreatedAt = new Date()
    expectedId = 1
    expectedQuestion = "To be or not to be?"
    entry = null

    beforeEach ->
        entry = new Entry(expectedId, expectedQuestion, expectedAnswer, expectedCreatedAt)

    describe '#getAnswer', ->
        it "returns the answer", ->
            assert.equal entry.getAnswer(), expectedAnswer

    describe '#getCreatedAt', ->
        it "returns the creation date", ->
            assert.equal entry.getCreatedAt(), expectedCreatedAt

    describe '#getId', ->
        it "returns the id", ->
            assert.equal entry.getId(), expectedId

    describe '#getQuestion', ->
        it "returns the question", ->
            assert.equal entry.getQuestion(), expectedQuestion
