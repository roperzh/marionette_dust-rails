Class.module "TestsApp", (TestsApp, Class, Backbone, Marionette, $, _) ->

  TestsApp.Router = Marionette.AppRouter.extend(appRoutes: {})

  API = {}

  TestsApp.addInitializer ->
    router = new TestsApp.Router(controller: API)
