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
        "#{file_name.singularize}#{extension}"
      end

      def plural_file_name
        "#{file_name.pluralize}#{extension}"
      end

      def asset_file_name(type)
        "#{@submodule_name.downcase.singularize}_#{type}#{extension}"
      end

      def singular_entity_name
        file_name.singularize.camelize
      end

      def plural_entity_name
        file_name.pluralize.camelize
      end

      def sub_app_name
        [file_name.camelize, "App"].join("")
      end

      def sub_app_file_name
        [file_name.singularize.downcase, "_app", "#{extension}"].join("")
      end

      def sub_app_scope
        @submodule_name.camelize
      end

      def extension
        @ext ||= options.coffeescript ? ".js.coffee" : ".js"
      end

      def app_name
        rails_app_name.camelize
      end

      def rails_app_name
        Rails.application.class.name.split('::').first
      end

      def trackeable_directory(path)
        empty_directory path
        template ".gitkeep", "#{path}/.gitkeep"
      end
    end
  end
end
