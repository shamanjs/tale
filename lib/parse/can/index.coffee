crud    = require './crud'
isCrud  = require './crud/isCrud'
auth    = require './auth'
service = require './service'

module.exports = (app, tokens, role) ->

  if isCrud tokens[0] then crud app, tokens, role
  else if tokens[0] is 'login' then auth app, tokens, role
  else service app, tokens, role

  return app