Marionette = require 'backbone.marionette'

BeginView      = require 'views/begin.coffee'
AboutView      = require 'views/about.coffee'

defaultController =
  doIndex: ->
    window.App.page.content.show new BeginView()
  doAbout: ->
    console.log 'about'
    new BaseView view: 'AboutView'

module.exports = new Marionette.AppRouter
  controller: defaultController
  appRoutes:
    "":          "doIndex"
    "about":     "doAbout"
