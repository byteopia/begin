$          = require 'jquery'
Backbone   = require 'backbone'
Backbone.$ = $
Marionette = require 'backbone.marionette'

# custom renderer
Marionette.Renderer.render = (template, data) ->
  template.render data

window.App = new Marionette.Application()

Router     = require 'routers/default.coffee'
Controller = require 'controllers/default.coffee'
Views      = require 'views/views.coffee'

App.navigate = (route, options) ->
  options ?= {}

  history.pushState '', '', route

  Backbone.history.checkUrl()

App.on 'before:start', =>
  $(document).on 'click', 'a', (e) ->
    return if e.metaKey

    path = e.target.href || $(e.target).parents('a')[0].href
    href = $(@).attr 'href'

    if /localhost/.test path
      e.preventDefault()
      App.Router.navigate href, trigger: true

App.on 'start', =>
  App.Router = new Router
    controller: new Controller

  App.Views  = Views

  App.Body   = new Views[ 'regions/body' ]

  Backbone.history.start pushState: true

$ ->
  App.start()
