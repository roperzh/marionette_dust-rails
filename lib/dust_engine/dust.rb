require 'execjs'
require 'pathname'

module MarionetteDust
  class Dust
    class << self
      def precompile(source, name)
        context.call('dust.compile', source, name)
      end

      private

      def context
        @context ||= ExecJS.compile(source)
      end

      def source
        @source ||= path.read
      end

      def path
        @path ||= assets_path.join('dust.js')
      end

      def assets_path
        @assets_path ||= Pathname(MarionetteDust.path)
      end
    end
  end
end
