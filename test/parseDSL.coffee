require 'mocha'
should    = require 'should'
fs        = require 'fs'
path      = require 'path'
parseDSL  = require '../lib/parseDSL'
AST       = require './data/chanjsAST'
storyfile = path.resolve(__dirname+'/data/chanjs.story')

describe 'parseDSL', ->
  it 'should parse a textfile DSL to AST', (done) ->

    ast = fs.readFileSync storyfile, 'utf8'
    app = parseDSL ast

    #console.log JSON.stringify app

    #app.should.eql AST

    done()