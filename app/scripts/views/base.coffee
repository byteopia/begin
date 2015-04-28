Backbone   = require 'backbone'
Marionette = require 'backbone.marionette'

RootRegion     = require 'views/regions/container.coffee'
BaseLayout     = require 'views/layouts/base.coffee'

BeginView      = require 'views/begin.coffee'
AboutView      = require 'views/about.coffee'

module.exports = (options) ->
  root      = new RootRegion()
  page      = new BaseLayout()

  root.show page
  page.content.show new BeginView options
