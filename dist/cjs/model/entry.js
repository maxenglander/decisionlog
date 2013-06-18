"use strict";
var Entry;

Entry = (function() {
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

module.exports = Entry;
