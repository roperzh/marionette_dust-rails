require 'test_helper'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Md::Generators::InstallGenerator
  destination File.expand_path("../templates", __FILE__)

  test "creates the folder structure" do
    run_generator

    assert_directory "app/assets/javascripts/entities"
    assert_directory "app/assets/templates"
    assert_directory "app/assets/javascripts/apps"
  end

  test "creates the default application file(javascript)" do
    run_generator

    assert_file "app/assets/javascripts/app.js"
  end

  test "creates the coffeescript application file if required" do
    run_generator %w(-c)

    assert_file "app/assets/javascripts/app.js.coffee"
  end

  test "genereates the manifest(default)" do
    run_generator

    assert_file "app/assets/javascripts/application.js"
  end

  test "injects the required libraries(default)" do
    run_generator

    assert_file "app/assets/javascripts/application.js", /require marionette_dust/
    assert_file "app/assets/javascripts/application.js", /require app/
  end

  test "injects the required paths(default)" do
    run_generator

    assert_file "app/assets/javascripts/application.js", /require_tree \.\/apps/
    assert_file "app/assets/javascripts/application.js", /require_tree \.\/entities/
    assert_file "app/assets/javascripts/application.js", /require_tree \.\.\/templates/
  end
end
