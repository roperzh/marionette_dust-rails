require 'generators/marionette_dust/helpers'

module MarionetteDust
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include MarionetteDust::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a MarionetteDust.js skeleton directory structure and manifest"

      class_option :coffeescript,
                    type: :boolean,
                    aliases: "-c",
                    default: false,
                    desc: "Generate CoffeeScript files"

      class_option :manifest,
                    type: :string,
                    aliases: "-m",
                    default: "application.js",
                    desc: "Javascript manifest file to modify (or create)"

      def create_dir_layout
        empty_directory entities_path
        empty_directory apps_path
      end

      def create_app_file
        coffee = options.coffeescript
        ext = coffee ? ".js.coffee" : ".js"
        template "app#{ext}", "#{javascript_path}/app#{ext}"
      end

      def inject_required_files
        manifest = File.join(javascript_path, options.manifest)
        libs = %w(marionette_dust app)
        paths = %w(./apps ./entities ../templates)

        out = []
        out << libs.map{ |lib| "//= require #{lib}" }
        out << paths.map{ |path| "//= require_tree #{path}" }
        out = out.join("\n") + "\n"

        in_root do
          create_file(manifest) unless File.exists?(manifest)
          if File.open(manifest).read().include?('//= require_tree')
            inject_into_file(manifest, out, before: '//= require_tree')
          else
            append_file(manifest, out)
          end
        end
      end

    end
  end
end
