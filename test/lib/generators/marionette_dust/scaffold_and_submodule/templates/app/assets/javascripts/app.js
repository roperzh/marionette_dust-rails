var Class = new Marionette.Application();

Class.addRegions({
  //Add application regions here
});

//Navigate to specific route
Class.navigate = function (route, options) {
  options || (options = {});
  Backbone.history.navigate(route, options);
};

//Returns current route
Class.getCurrentRoute = function () {
  return Backbone.history.fragment;
};

Class.on('initialize:after', function () {
  //Things to do after app initialize
  if (Backbone.history) {
    Backbone.history.start({
      pushState: true
    });
  }
});
