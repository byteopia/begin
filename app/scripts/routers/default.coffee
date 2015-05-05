Marionette = require 'backbone.marionette'

module.exports = Marionette.AppRouter.extend
  appRoutes:
    "":          "doIndex"
    "about":     "doAbout"
