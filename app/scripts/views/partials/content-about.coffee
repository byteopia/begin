Backbone   = require 'backbone'
Marionette = require 'backbone.marionette'

module.exports = Backbone.Marionette.ItemView.extend
  tagName: 'p'
  className: 'about'
  template: require 'templates/partials/content-about.ms'
