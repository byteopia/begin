Backbone   = require 'backbone'
Marionette = require 'backbone.marionette'

module.exports = Backbone.Marionette.ItemView.extend
  tagName: 'p'
  className: 'begin'
  template: require 'templates/partials/content-begin.ms'
