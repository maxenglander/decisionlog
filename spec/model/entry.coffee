Entry = requirejs('decisionlog/core/model/entry')

describe 'Entry', ->
    beforeEach ->
        @entry = new Entry()

    describe '#answer', ->
        it "returns the answer", ->
            @entry.answer()
