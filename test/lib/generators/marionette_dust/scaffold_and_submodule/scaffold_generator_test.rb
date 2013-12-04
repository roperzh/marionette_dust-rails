require 'test_helper'

class ScaffoldGeneratorTest < Rails::Generators::TestCase
  tests Md::Generators::ScaffoldGenerator
  destination File.expand_path("../templates", __FILE__)

  test "creates the folder structure" do
    run_generator %w(test)

    assert_directory "app/assets/javascripts/apps/test"
  end

  test "creates the sub application file" do
    run_generator %w(test)

    assert_file "app/assets/javascripts/apps/test/test_app.js"
  end

  test "creates the entities file" do
    run_generator %w(test)

    assert_file "app/assets/javascripts/entities/test.js"
  end

  test "creates coffeescript sub application file if requried" do
    run_generator %w(test -c)

    assert_file "app/assets/javascripts/apps/test/test_app.js.coffee"
  end

  test "creates coffeescript entities file if required" do
    run_generator %w(test -c)

    assert_file "app/assets/javascripts/entities/test.js.coffee"
  end
end
