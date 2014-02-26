natural    = require 'natural'
noun       = new natural.NounInflector()
prepModel  = require '../prepModel'
isModel    = require '../isModel'
isSingular = require '../isSingular'

module.exports = (app, tokens, role) ->

  model = prepModel(tokens[0]) if isModel(tokens[0])
  model = prepModel(tokens[1]) if isModel(tokens[1])
  if isSingular(model)
    app.roles[role].has = [] if !app.roles[role].has?
    app.roles[role].has.push model
  else
    app.roles[role].hasMany = [] if !app.roles[role].hasMany?
    app.roles[role].hasMany.push noun.singularize(model)

  return app