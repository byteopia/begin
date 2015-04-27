$          = require 'jquery'
Backbone   = require 'backbone'
Backbone.$ = $
Marionette = require 'backbone.marionette'

myModel    = require './models/mymodel.coffee'
myView     = require './views/myview.coffee'

$ ->
  App = new Marionette.Application()

  App.on 'start', ->
    mymodel = new myModel text: 'Begin here.'

    staticView = new myView( model: mymodel )
    staticView.render()

  App.start()

  # console.log $
  # console.log Marionette
  # console.log Backbone
