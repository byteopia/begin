Backbone   = require 'backbone'
Marionette = require 'backbone.marionette'

module.exports = Backbone.Marionette.LayoutView.extend
  template: require 'templates/layouts/page.ms'
  regions:
    access: '.access'
    content: '.content'
