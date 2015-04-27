Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  el: 'body'
  template: (data) ->
    template = require '../../templates/begin.ms'
    template.render data
