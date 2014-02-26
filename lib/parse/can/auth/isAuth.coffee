authTypes = 
  facebook: ['facebook', 'fb']
  twitter:  ['twitter']
  password: ['password', 'username', 'email']

module.exports = (token) ->
  token = token.toLowerCase()
  for auth, names of authTypes
    return auth if token in names
  return false