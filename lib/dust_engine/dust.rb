require 'execjs'
require 'pathname'

module MarionetteDust
  class Dust
    class << self
      def precompile(src, name)
        context.call('dust.compile', src, name)
      end

      private

      def context
        @context ||= ExecJS.compile(source)
      end

      def source
        @source ||= open(path).read
      end

      def path
        @path ||= assets_path.join('dust-full-2.2.2.js')
      end

      def assets_path
        @assets_path ||= Pathname(MarionetteDust.path)
      end
    end
  end
end
