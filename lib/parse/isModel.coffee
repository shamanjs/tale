module.exports = (token) ->
  return false if !token?
  return false if !isNaN(token)
  return token.charAt(0) is token.charAt(0).toUpperCase()