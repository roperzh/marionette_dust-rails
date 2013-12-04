Class.module("TestsApp", function (TestsApp, Class, Backbone, Marionette, $, _) {
  TestsApp.Router = Marionette.AppRouter.extend({
    appRoutes: {}
  });

  var API = {};

  TestsApp.addInitializer(function() {
    router = new TestsApp.Router({
      controller: API
    });
  });
});
