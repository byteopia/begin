Backbone   = require 'backbone'
Marionette = require 'backbone.marionette'

AccessView = require 'views/global/access.coffee'

module.exports = Backbone.Marionette.LayoutView.extend
  template: require 'templates/layouts/base.ms'
  regions:
    access: '.access'
    content: '.content'

  onBeforeShow: ->
    @showChildView 'access', new AccessView()
