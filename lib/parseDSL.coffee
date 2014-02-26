cParse = require('cirru-parser').parse

module.exports = (story) ->

  ast = cParse story
  app = 
    stories: {}
    models: {}

  for node in ast
    model = node.shift()
    if model != "#" and model != "//" 
      operator = node[0][0]
      if operator is 'can'
        app.stories[model] = node.map (story) -> 
          story.shift()
          story.join ' '
      else
        for line in node
          op = (line.shift()).slice 0, -1
          
          if !app.models[model]? then app.models[model] = {}
          if !app.models[model][op]? then app.models[model][op] = []
          app.models[model][op].push line.join ' '


  return app
