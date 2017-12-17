require 'climate_control'
module Cocaine
  # Utility class
  class Utility
    def self.with_modified_environment(env, &block)
      ClimateControl.modify(env, &block)
    end

    def self.read_stream(io)
      result = ""
      while partial_result = io.read(8192)
        result << partial_result
      end
      result
    end

    def self.bit_bucket
      OS.unix? ? "2>/dev/null" : "2>NUL"
    end

    def self.shell_quote(string)
      return "" if string.nil?
      string = string.to_s if string.respond_to? :to_s

      if OS.unix?
        if string.empty?
          "''"
        else
          string.split("'", -1).map { |mapped_value| "'#{mapped_value}'" }.join("\\'")
        end
      else
        %{"#{string}"}
      end
    end

    def self.stringify_keys(hash)
      Hash[hash.map { |key, value| [key.to_s, value] }]
    end
  end
end
