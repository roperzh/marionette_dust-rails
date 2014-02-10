<%= app_name %>.module "<%= @parent_name.camelize %>.<%= file_name.camelize %>", (<%= sub_app_scope %>, <%= app_name %>, Backbone, Marionette, $, _) ->
  <%= sub_app_scope %>.Controller = {}
