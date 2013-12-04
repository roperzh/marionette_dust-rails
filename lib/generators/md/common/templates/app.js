<%= app_name %>.module("<%= sub_app_name %>", function (<%= sub_app_name %>, <%= app_name %>, Backbone, Marionette, $, _) {
  <%= sub_app_name %>.Router = Marionette.AppRouter.extend({
    appRoutes: {}
  });

  var API = {};

  <%= sub_app_name %>.addInitializer(function() {
    router = new <%= sub_app_name %>.Router({
      controller: API
    });
  });
});
