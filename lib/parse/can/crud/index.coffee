natural    = require 'natural'
noun       = new natural.NounInflector()
getCrudOp  = require './getCrudOp'
prepModel  = require '../../prepModel'
isModel    = require '../../isModel'
isSingular = require '../../isSingular'

getNextModel = (tokens) ->

  model = prepModel(tokens.shift()) until isModel(model)

  return {
    model: model
    tokens: tokens
  }

module.exports = (app, tokens, role) ->

  crudOp = getCrudOp(tokens.shift())

  {model, tokens} = getNextModel(tokens)
  console.log tokens
  if isSingular(model)
    app.models[model] = {} if !app.models[model]?
    app.models[model][crudOp] = [] if !app.models[model][crudOp]?
    app.models[model][crudOp].push role if role !in app.models[model][crudOp]

  else 
    console.log model
    newModel = noun.singularize model
    app.models[newModel] = {} if !app.models[newModel]?
    app.models[newModel][crudOp] = [] if !app.models[newModel][crudOp]?
    app.models[newModel][crudOp].push role if role !in app.models[newModel][crudOp]

  # model relations
  if tokens[2] in ['on', 'in']
    model2 = tokens[3] if isModel(tokens[3])
    model2 = tokens[4] if isModel(tokens[4])
    model2 = noun.singularize model2
    app.models[newModel] = {} if !app.models[newModel]?
    app.models[newModel]['belongsTo'] = [] if !app.models[newModel]['belongsTo']?
    app.models[newModel]['belongsTo'].push model2 if model2 !in app.models[newModel]['belongsTo']

    if isSingular(model)
      app.models[model2].has = [] if !app.models[model2].has?
      app.models[model2].has.push newModel
    else
      app.models[model2].hasMany = [] if !app.models[model2].hasMany?
      app.models[model2].hasMany.push newModel


  return app