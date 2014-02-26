natural = require 'natural'
noun = new natural.NounInflector()
crudOps = 
  create:   ['create', 'make']
  read:     ['read', 'see', 'browse', 'list', 'view', 'find', 'lookup']
  update:   ['update', 'edit']
  'delete': ['delete', 'remove']

authTypes = ['Facebook', 'Twitter', 'Password']

isCrud = (token) ->
  for op, ops of crudOps
    return op if token in ops
  return false

isModel = (token) ->
  return false if !token?
  return token.charAt(0) is token.charAt(0).toUpperCase()

isSingular = (model) ->
  return false if !model?
  return model is noun.singularize(model)

prepModel = (model) -> model

module.exports = (ast) ->

  app =
    roles:    {}
    models:   {}
    services: {}

  for role, stories of ast.stories

    # push role
    app.roles[role] = {} if !app.roles[role]? 

    for story in stories 

      tokens = story.split(' ')      
      op     = tokens.shift()

      ## story

      if op is 'can'


        # auth
        else if tokens[0] is 'login'
          auth = tokens[1] if tokens[1] in authTypes
          auth = tokens[2] if tokens[2] in authTypes
          app.roles[role].auth = auth

        # service
        else
          console.log "service"


      ## relationship

      else if op is 'has' 
        model = prepModel(tokens[0]) if isModel(tokens[0])
        model = prepModel(tokens[1]) if isModel(tokens[1])
        if isSingular(model)
          app.roles[role].has = [] if !app.roles[role].has?
          app.roles[role].has.push model
        else
          app.roles[role].hasMany = [] if !app.roles[role].hasMany?
          app.roles[role].hasMany.push noun.singularize(model)

  return app