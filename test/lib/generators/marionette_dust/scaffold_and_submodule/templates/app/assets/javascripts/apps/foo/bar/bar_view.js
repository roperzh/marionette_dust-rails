Class.module("Bar.Bar", function (Bar, Class, Backbone, Marionette, $, _) {
  Bar.View = Marionette.ItemView.extend({
    template: "templates/bar.jst.dust"
  });
});
