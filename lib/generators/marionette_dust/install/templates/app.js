var <%= app_name %> = new Marionette.Application();

<%= app_name %>.addRegions({
  //Add application regions here
});

//Navigate to specific route
<%= app_name %>.navigate = function (route, options) {
  options || (options = {});
  Backbone.history.navigate(route, options);
};

//Returns current route
<%= app_name %>.getCurrentRoute = function () {
  return Backbone.history.fragment;
};

<%= app_name %>.on('initialize:after', function () {
  //Things to do after app initialize
});
