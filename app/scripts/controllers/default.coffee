Marionette = require 'backbone.marionette'

module.exports = Marionette.Controller.extend
  doIndex: ->
    layout  = new window.App.Views[ 'layouts/default' ]
    content = new window.App.Views[ 'partials/content-begin' ]

    window.App.Body.show layout 
    layout.content.show content
  doAbout: ->
    layout  = new window.App.Views[ 'layouts/default' ]
    content = new window.App.Views[ 'partials/content-about' ]

    window.App.Body.show layout 
    layout.content.show content
