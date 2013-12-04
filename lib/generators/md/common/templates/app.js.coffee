<%= app_name %>.module "<%= sub_app_name %>", (<%= sub_app_name %>, <%= app_name %>, Backbone, Marionette, $, _) ->

  <%= sub_app_name %>.Router = Marionette.AppRouter.extend(appRoutes: {})

  API = {}

  <%= sub_app_name %>.addInitializer ->
    router = new <%= sub_app_name %>.Router(controller: API)
