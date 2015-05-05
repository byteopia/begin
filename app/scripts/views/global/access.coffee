Backbone   = require 'backbone'
Marionette = require 'backbone.marionette'

module.exports = Backbone.Marionette.LayoutView.extend
  tagName: 'ul'
  className: 'access__items'
  template: require 'templates/global/access.ms'
