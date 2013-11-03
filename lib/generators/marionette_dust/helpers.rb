module MarionetteDust
  module Generators
    module Helpers

      def asset_path
        File.join('app', 'assets')
      end

      def javascript_path
        File.join(asset_path, 'javascripts')
      end

      def entities_path
        File.join(javascript_path, "entities")
      end

      def apps_path
        File.join(javascript_path, "apps")
      end

      def template_path
        File.join(asset_path, "templates")
      end

      def singular_file_name
        "#{file_name.singularize}#{@ext}"
      end

      def plural_file_name
        "#{file_name.pluralize}#{@ext}"
      end

      def view_file_name(option)
        "#{option.singularize}_view#{@ext}"
      end

      def controller_file_name(option)
        "#{option.singularize}_controller#{@ext}"
      end

      def singular_entity_name
        file_name.singularize.camelize
      end

      def plural_entity_name
        file_name.pluralize.camelize
      end

      def sub_app_name
        [file_name.pluralize.camelize, "App"].join("")
      end

      def sub_app_file_name
        [file_name.singularize.downcase, "_app", "#{@ext}"].join("")
      end

      def sub_app_scope
        @submodule_name.capitalize
      end

      def app_name
        rails_app_name.camelize
      end

      def app_filename
        rails_app_name.underscore
      end

      def rails_app_name
        Rails.application.class.name.split('::').first
      end

    end
  end
end
