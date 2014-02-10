require 'generators/md/helpers'

module Md
  module Generators
    class SubmoduleGenerator < Rails::Generators::NamedBase
      include MarionetteDust::Generators::Helpers
      include Thor::Actions

      source_root File.expand_path("../../common/templates", __FILE__)

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
        @parent_name    = options.parent
        @submodule_name = file_name
      end

      def create_subapp
        create_asset("view")
        create_asset("controller")
        create_dust_template
      end

    protected
      def create_asset(type)
        file = File.join(apps_path, @parent_name.underscore, file_name,
          asset_file_name(type))

        template "#{type}#{extension}", file
      end

      def create_dust_template
        empty_directory File.join(template_path, @parent_name.underscore,
          @submodule_name.underscore)

        file = File.join(template_path, @parent_name.underscore, @submodule_name,
          "#{@submodule_name}.jst.dust")

        template "template.jst.dust", file
      end
    end
  end
end
