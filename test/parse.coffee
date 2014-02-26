require 'mocha'
should = require 'should'
fs     = require 'fs'
path   = require 'path'
parse  = require '../lib/parse'
parseDSL = require '../lib/parseDSL'
print = (obj) -> 
  console.log require('util').inspect(obj, depth: null)

describe 'parse', ->


  ###
  chanAST      = require './data/chanjsAST'
  chanContract = require './data/chanjsContract'

  it 'should parse a chanjs AST', (done) ->

    app = parse chanAST
    app.should.eql chanContract
    done()

  popAST      = require './data/popshopAST'
  popContract = require './data/popshopContract'

  it 'should parse popshop AST', (done) ->

    app = parse popAST
    app.should.eql popContract
    done()

  sgAST      = require './data/sportsgametAST'
  #sgContract = require './data/popshopContract'

  it 'should parse SG AST', (done) ->

    #app = parse sgAST
    #print app
    #app.should.eql sgContract
    done()

  ###
  lookAST = require './data/lookingAST'
  #sgContract = require './data/popshopContract'

  it 'should parse looking AST', (done) ->

    app = parse lookAST
    print app
    #app.should.eql sgContract
    done()