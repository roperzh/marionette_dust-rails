require 'test_helper'

class TiltDustTest < Test::Unit::TestCase

  def expected_result(template, jst=true)
    template_name = "templates/hello"
    compiled = MarionetteDust::Dust.precompile(template.data, template_name)
    result = "(function (ctx, callback) {\n  dust.loadSource(#{compiled.inspect});\n"
    if jst
      result + "  dust.render('#{template_name}', ctx, callback);\n})\n"
    else
      result << "})();\n"
    end
  end

  def test_mime_type
    assert_equal 'application/javascript', MarionetteDust::TiltDust.default_mime_type
  end

  def test_hello_jst_dust
    template = MarionetteDust::TiltDust.new File.expand_path("../templates/hello.jst.dust", __FILE__)
    assert_equal expected_result(template), template.render(MockAsset.new)
  end

  def test_hello_dust
    template = MarionetteDust::TiltDust.new File.expand_path("../templates/hello.dust", __FILE__)
    assert_equal expected_result(template, false), template.render(MockAsset.new)
  end

end
