# coding: UTF-8

module Cocaine
  class CommandLine
    # Class responsible for running commands using IO.popen with JRuby.
    # Should be used while getting error `unsupported spawn option: out` with JRuby.
    class PopenRunner
      def self.supported?
        true
      end

      def supported?
        self.class.supported?
      end

      def call(command, env = {}, options = {})
        Utility.with_modified_environment(env) do
          IO.popen(command, "r", options) do |pipe|
            Output.new(pipe.read)
          end
        end
      end

    end
  end
end
