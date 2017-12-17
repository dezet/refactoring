# coding: UTF-8

require 'climate_control'

module Cocaine
  class CommandLine
    # Class responsible for backticks like command running.
    class BackticksRunner
      def self.supported?
        true
      end

      def supported?
        self.class.supported?
      end

      def call(command, env = {}, options = {})
        Utility.with_modified_environment(env) do
          Output.new(`#{command}`)
        end
      end
    end
  end
end
