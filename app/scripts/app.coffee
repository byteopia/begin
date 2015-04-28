$          = require 'jquery'
Backbone   = require 'backbone'
Backbone.$ = $
Marionette = require 'backbone.marionette'

$ ->
  App = new Marionette.Application()

  Marionette.Renderer.render = (template, data) ->
    template.render data

  App.on 'start', ->
    beginModel = require 'models/begin.coffee'
    
    pageLayout = require 'views/layouts/page.coffee'
    
    accessView = require 'views/access.coffee'
    beginView  = require 'views/begin.coffee'

    container = new Backbone.Marionette.Region
      el: 'body'

    page    = new pageLayout()
    access  = new accessView()
    begin   = new beginView
      model: new beginModel text: 'Begin here.'

    container.show page
    page.access.show access
    page.content.show begin

  App.start()
