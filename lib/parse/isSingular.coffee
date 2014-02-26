natural = require 'natural'
noun    = new natural.NounInflector()

module.exports = (model) ->
  return false if !model?
  return model is noun.singularize(model)