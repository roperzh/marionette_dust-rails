require 'bundler'
Bundler.require

require 'test/unit'
require 'rails/all'
require 'rails/generators'
require 'rails/generators/test_case'

class TestApp < Rails::Application
  config.root = File.dirname(__FILE__)
end
Rails.application = TestApp

module Rails
  def self.root
    @root ||= File.expand_path("../../vendor/assets/javascripts/marionette_dust/", __FILE__)
  end
end
Rails.application.config.root = Rails.root

require 'generators/md/install/install_generator'
require 'generators/md/scaffold/scaffold_generator'
require 'generators/md/submodule/submodule_generator'
