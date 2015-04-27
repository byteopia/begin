$          = require 'jquery'
Backbone   = require 'backbone'
Backbone.$ = $
Marionette = require 'backbone.marionette'

$ ->
  template = require '../templates/begin.ms'
  message  = template.render { text: 'Begin here.' }

  $( 'body' ).prepend message

  # console.log $
  # console.log Marionette
  # console.log Backbone
