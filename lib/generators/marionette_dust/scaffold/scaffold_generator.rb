require 'generators/marionette_dust/helpers'

module MarionetteDust
  module Generators
    class ScaffoldGenerator < Rails::Generators::NamedBase
      include MarionetteDust::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a Marionette.js resource scaffold"

      class_option :coffeescript,
                    type: :boolean,
                    aliases: "-c",
                    default: false,
                    desc: "Generate Coffeescript files"

      class_option :submodule,
                    type: :array,
                    aliases: "--sub",
                    default: "",
                    desc: ""

      def parse_options
        js = options.javascript
        @ext = js ? ".js.coffee" : ".js"
      end

      def create_marionette_entity
        file = File.join(entities_path, singular_file_name)
        template "entity#{@ext}", file
      end

      def create_marionette_app
        empty_directory File.join(apps_path, file_name.downcase)
        file = File.join(apps_path, file_name.downcase, sub_app_file_name)
        template "app.js", file
      end

      def create_subapp
        return if options.submodule.empty?
        for submodule in options.submodule
          @submodule_name = submodule
          empty_directory File.join(apps_path, file_name.downcase, submodule.downcase)
          create_marionette_view
          create_marionette_controller
          # create_dust_template
        end
      end

      protected

      def create_marionette_view
        file = File.join(apps_path, file_name.downcase, @submodule_name.downcase, view_file_name(@submodule_name.downcase))
        template "view#{@ext}", file
      end

      def create_marionette_controller
        file = File.join(apps_path, file_name.downcase, @submodule_name.downcase, controller_file_name(@submodule_name.downcase))
        template "controller#{@ext}", file
      end

      # def create_dust_template(submodule_name.downcase)
      #   empty_directory File.join(template_path, submodule_name.downcase)
      #   file = File.join(template_path, submodule_name.downcase, "#{submodule_name.downcase}.jst.dust")
      #   template "template.jst.dust", file
      # end
    end
  end
end
