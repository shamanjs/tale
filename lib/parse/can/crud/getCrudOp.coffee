crudOps = require './crudOps'

module.exports = (token) ->
  for op, ops of crudOps
    return op if token in ops
  return false