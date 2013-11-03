<%= app_name %> = new Marionette.Application()

#Add application regions here
<%= app_name %>.addRegions {}

#Navigate to specific route
<%= app_name %>.navigate = (route, options) ->
  options or (options = {})
  Backbone.history.navigate route, options

#Returns current route
<%= app_name %>.getCurrentRoute = ->
  Backbone.history.fragment

<%= app_name %>.on "initialize:after", ->
  #Things to do after app initialize
