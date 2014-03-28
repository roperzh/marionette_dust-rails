Backbone.Marionette.Renderer.render = function (templateName, data) {
  var renderedTemplate;

  var callback = function renderCallback(err, out) {
    renderedTemplate = out;
  };

  if (dust.cache[templateName]) {
    dust.render(templateName, data, callback);
  } else if (JST && JST[templateName]) {
    JST[templateName](data, callback);
  } else {
    throw "Template '" + templateName + "' not found!";
  }

  return renderedTemplate;
};
