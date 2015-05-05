Backbone   = require 'backbone'
Marionette = require 'backbone.marionette'

module.exports = Backbone.Marionette.ItemView.extend
  className: 'welcome'
  template: require 'templates/partials/content-begin.ms'
