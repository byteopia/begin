Backbone   = require 'backbone'
Marionette = require 'backbone.marionette'

Layout = Backbone.Marionette.LayoutView.extend
  className: 'page'
  template: require 'templates/layouts/default.ms'
  regions:
    access:  '.access'
    content: '.content'

  onBeforeShow: ->
    @showChildView 'access', new window.App.Views[ 'global/access' ]

module.exports = Layout
