Class = new Marionette.Application()

#Add application regions here
Class.addRegions {}

#Navigate to specific route
Class.navigate = (route, options) ->
  options or (options = {})
  Backbone.history.navigate route, options

#Returns current route
Class.getCurrentRoute = ->
  Backbone.history.fragment

Class.on "initialize:after", ->
  #Things to do after app initialize
