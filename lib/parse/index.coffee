dotty = require 'dotty'
can   = require './can'
has   = require './has'

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

      switch op
        when "can" then can app, tokens, role
        when "has" then has app, tokens, role

  return app