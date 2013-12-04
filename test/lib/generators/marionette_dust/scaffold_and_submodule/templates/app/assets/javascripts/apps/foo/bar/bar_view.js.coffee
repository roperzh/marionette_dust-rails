Class.module "Bar.Bar", (Bar, Class, Backbone, Marionette, $, _) ->

  Bar.View = Marionette.ItemView.extend(template: "templates/bar.jst.dust")
