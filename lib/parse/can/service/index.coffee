#natural = require 'natural'
#noun    = new natural.NounInflector()
isModel = require '../../isModel'

module.exports = (app, tokens, role) ->

  name = tokens[0]

  if isModel tokens[1]
    name += tokens[1]
  else if isModel tokens[2]
    name += tokens[1].charAt(0).toUpperCase()
    name += tokens[2]

  app.services[name] = {}

  return app