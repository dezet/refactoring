# coding: UTF-8

module Cocaine
  # Class representing command line exception
  class CommandLineError < StandardError; end
  # Class representing command not found exception
  class CommandNotFoundError < CommandLineError; end
  # Class representing command's exit status error.
  class ExitStatusError < CommandLineError; end
  # Class representing command interpolation error.
  class InterpolationError < CommandLineError; end
end
