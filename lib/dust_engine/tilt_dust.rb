require 'tilt'

module MarionetteDust

  class TiltDust < Tilt::Template

    def self.default_mime_type
      'application/javascript'
    end

    def prepare
      @preamble = "(function (ctx, callback) {\n"
      @postamble = "})"
      @postamble << "();" unless jst?
      @postamble << "\n"
    end

    def evaluate(scope, locals, &block)
      template_name = scope.logical_path.to_s.gsub('"', "")
      compiled = Dust.precompile(data, template_name)

      template = "  dust.loadSource(#{compiled.inspect});\n"

      if jst?
        template << "  dust.render('#{template_name}', ctx, callback);\n"
      end

      combined(template)
    end

    def combined(template)
      @preamble + template + @postamble
    end

    def jst?
      File.basename(@file).split('.').include? 'jst'
    end

  end
end
