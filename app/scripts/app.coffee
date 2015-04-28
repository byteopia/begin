$          = require 'jquery'
Backbone   = require 'backbone'
Backbone.$ = $
Marionette = require 'backbone.marionette'

Router     = require 'routers/default.coffee'

RootView      = require 'views/regions/container.coffee'
BaseLayout     = require 'views/layouts/base.coffee'

$ ->
  window.App = new Marionette.Application()

  App.Views = {}

  Marionette.Renderer.render = (template, data) ->
    template.render data
  
  App.navigate = (route,  options) ->
    options ?= {}
    history.pushState('', '', route);
    Backbone.history.checkUrl()

  App.getCurrentRoute = ->
    Backbone.history.fragment

  App.on 'before:start', =>
    $(document).on 'click', 'a', (e) ->
      return if e.metaKey

      href = e.target.href || $(e.target).parents('a')[0].href
      if /localhost/.test(href)
        e.preventDefault()
        App.navigate href

  App.on 'start', =>
    Backbone.history.start pushState: true

  App.start()
