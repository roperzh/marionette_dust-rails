<%= app_name %>.module "<%= file_name.capitalize %>.<%= sub_app_scope %>", (<%= sub_app_scope %>, <%= app_name %>, Backbone, Marionette, $, _) ->

  <%= sub_app_scope %>.View = Marionette.ItemView.extend(template: "<%= @submodule_name %>.jst.dust")
