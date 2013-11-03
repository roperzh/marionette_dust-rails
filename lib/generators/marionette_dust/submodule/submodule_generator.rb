require 'generators/marionette_dust/helpers'

module MarionetteDust
  module Generators
    class SubmoduleGenerator < Rails::Generators::NamedBase
      include MarionetteDust::Generators::Helpers
      include Thor::Actions

      source_root File.expand_path("../../scaffold/templates", __FILE__)

      desc "Generates a Marionette.js resource scaffold"

      class_option :coffeescript,
                    type: :boolean,
                    aliases: "-c",
                    default: false,
                    desc: "Generate Coffeescript files"

      class_option :parent,
                    type: :string,
                    aliases: "-p",
                    required: true,
                    desc: "Parent app (required)"

      def parse_options
        js              = options.javascript
        @ext            = js ? ".js.coffee" : ".js"
        @parent_name    = options.parent
        @submodule_name = file_name
      end

      def create_subapp
        create_marionette_view
        create_marionette_controller
        # create_dust_template
      end

      protected
      def create_marionette_view
        file = File.join(apps_path, @parent_name.downcase, file_name, view_file_name(file_name))
        template "view#{@ext}", file
      end

      def create_marionette_controller
        file = File.join(apps_path, @parent_name.downcase, file_name, controller_file_name(file_name))
        template "controller#{@ext}", file
      end

      # def create_dust_template(sub@parent_name)
      #   empty_directory File.join(template_path, subparent_name)
      #   file = File.join(template_path, subparent_name, "#{subparent_name}.jst.dust")
      #   template "template.jst.dust", file
      # end
    end
  end
end
