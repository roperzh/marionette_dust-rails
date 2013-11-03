<%= app_name %>.module("<%= file_name.capitalize %>.<%= sub_app_scope %>", function (<%= sub_app_scope %>, <%= app_name %>, Backbone, Marionette, $, _) {
  <%= sub_app_scope %>.View = Marionette.ItemView.extend({
    template: "templates/<%= @submodule_name %>.jst.dust"
  });
});
