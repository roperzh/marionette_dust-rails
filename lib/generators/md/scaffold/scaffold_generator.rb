require 'generators/md/helpers'

module Md
  module Generators
    class ScaffoldGenerator < Rails::Generators::NamedBase
      include MarionetteDust::Generators::Helpers

      source_root File.expand_path("../../common/templates", __FILE__)

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

      def create_marionette_entity
        file = File.join(entities_path, singular_file_name)
        template "entity#{extension}", file
      end

      def create_marionette_app
        empty_directory File.join(apps_path, file_name.downcase)
        file = File.join(apps_path, file_name.downcase, sub_app_file_name)
        template "app#{extension}", file
      end

      def create_subapp
        return if options.submodule.empty?
        for submodule in options.submodule
          @submodule_name = submodule
          empty_directory File.join(apps_path, file_name.downcase, submodule.downcase)
          create_asset("view")
          create_asset("controller")
          create_dust_template
        end
      end

    protected
      def create_asset(type)
        file = File.join(apps_path, file_name.downcase, @submodule_name.downcase, asset_file_name(type))
        template "#{type}#{extension}", file
      end

      def create_dust_template
        empty_directory File.join(template_path, file_name.downcase, @submodule_name.downcase)
        file = File.join(template_path, file_name.downcase, @submodule_name.downcase, "#{@submodule_name.downcase}.jst.dust")
        template "template.jst.dust", file
      end
    end
  end
end
