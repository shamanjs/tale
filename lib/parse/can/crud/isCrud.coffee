crudOps = require './crudOps'

module.exports = (token) ->
  for op, ops of crudOps
    return true if token in ops
  return false