<%= app_name %>.module("Entities", function (Entities, <%= app_name %>, Backbone, Marionette, $, _) {

  Entities.<%= singular_entity_name %> = Backbone.Model.extend({});

  Entities.<%= plural_entity_name %>Collection = Backbone.Collection.extend({});

  var API = {};

});
