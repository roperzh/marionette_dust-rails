require 'generators/md/helpers'

module Md
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
        trackeable_directory entities_path
        trackeable_directory template_path
        trackeable_directory apps_path
      end

      def create_app_file
        template "app#{extension}", "#{javascript_path}/app#{extension}"
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
