module.exports = (model) -> 

  model = model.replace(/[^a-zA-Z 0-9]+/g, '')
  return model