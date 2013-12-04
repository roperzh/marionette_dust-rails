require 'test_helper'

class SubmoduleGeneratorTest < Rails::Generators::TestCase
  tests Md::Generators::SubmoduleGenerator
  destination File.expand_path("../templates", __FILE__)

  test "creates the folder structure" do
    run_generator %w(bar --parent foo)

    assert_directory "app/assets/javascripts/apps/foo"
    assert_directory "app/assets/javascripts/apps/foo/bar"
    assert_directory "app/assets/javascripts/entities"
  end

  test "creates the submodule application" do
    run_generator %w(bar --parent foo)

    assert_file "app/assets/javascripts/apps/foo/bar/bar_view.js"
    assert_file "app/assets/javascripts/apps/foo/bar/bar_controller.js"
  end
end
