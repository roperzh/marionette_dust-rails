Backbone.Marionette.Renderer.render = function (template, data) {
  var renderedTemplate;

  if (!JST[template]) throw "Template '" + template + "' not found!";

  JST[template](data, function (err, out) {
    renderedTemplate = out;
  });

  return renderedTemplate;
};
