(function(define) {
  return define([], function() {
    var Entry;
    return Entry = (function() {
      function Entry(id, question, answer, createdAt) {
        this.id = id;
        this.question = question;
        this.answer = answer;
        this.createdAt = createdAt;
      }

      Entry.prototype.getAnswer = function() {
        return this.answer;
      };

      Entry.prototype.getCreatedAt = function() {
        return this.createdAt;
      };

      Entry.prototype.getId = function() {
        return this.id;
      };

      Entry.prototype.getQuestion = function() {
        return this.question;
      };

      return Entry;

    })();
  });
})(typeof define === 'function' && (define.amd != null) ? define : function(ids, factory) {
  var deps;
  deps = ids.map(function(id) {
    return require(id);
  });
  return module.exports = factory.apply(null, deps);
});
