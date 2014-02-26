isAuth = require './isAuth'

module.exports = (app, tokens, role) ->

  if auth = isAuth(tokens[1]) 
  else if auth = isAuth(tokens[2])
  else return app
  
  app.roles[role].auth = auth

  return app