# coding: UTF-8

module Cocaine
  # Class responsible for creating and executing command lines.
  class CommandLine
    class << self
      attr_accessor :logger, :runner

      def path
        @supplemental_path ||= {}
      end

      def path=(supplemental_path)
        @supplemental_path = Array(supplemental_path).
            flatten.
            join(OS.path_separator)
      end

      def environment
        @supplemental_environment ||= {}
      end


      def runner
        @runner || best_runner
      end

      def runner_options
        @default_runner_options ||= {}
      end

      def fake
        @runner = FakeRunner.new
      end

      def fake!
        @runner = FakeRunner.new
      end

      def unfake
        @runner = nil
      end

      def unfake!
        @runner = nil
      end

      private

      def best_runner
        [PosixRunner, ProcessRunner, BackticksRunner].detect do |runner|
          runner.supported?
        end.new
      end
    end

    @environment = {}

    attr_reader :exit_status, :runner

    def clazz
      self.class
    end


    def initialize(binary, params = "", options = {})
      @binary = binary.dup
      @params = params.dup
      @options = options.dup
      @runner = @options.delete(:runner) || clazz.runner # -> wyzej rozwiazanie juz ale musze to ogarnac lepiej :-(
      @logger = @options.delete(:logger) || clazz.logger
      @swallow_stderr = @options.delete(:swallow_stderr)
      @expected_outcodes = @options.delete(:expected_outcodes) || [0]
      @environment = @options.delete(:environment) || {}
      @runner_options = @options.delete(:runner_options) || {}
    end

    def command(interpolations = {})
      cmd = [path_prefix, @binary, interpolate(@params, interpolations)]
      cmd << Utility.bit_bucket if @swallow_stderr
      cmd.join(" ").strip
    end

    def run(interpolations = {})
      @exit_status = nil
      begin
        full_command = command(interpolations)
        log("#{colored("Command")} :: #{full_command}")
        @output = execute(full_command)
      rescue Errno::ENOENT => error
        raise Cocaine::CommandNotFoundError, error.message
      ensure
        @exit_status = $?.respond_to?(:exitstatus) ? $?.exitstatus : 0
      end

      if @exit_status == 127
        raise Cocaine::CommandNotFoundError
      end

      unless @expected_outcodes.include?(@exit_status)
        message = [
            "Command '#{full_command}' returned #{@exit_status}. Expected #{@expected_outcodes.join(", ")}",
            "Here is the command output: STDOUT:\n", command_output,
            "\nSTDERR:\n", command_error_output
        ].join("\n")
        raise Cocaine::ExitStatusError, message
      end
      command_output
    end

    def command_output
      output.output
    end

    def command_error_output
      output.error_output
    end

    def output
      @output ||= Output.new
    end

    private

    def colored(text, ansi_color = "\e[32m")
      if @logger && @logger.respond_to?(:tty?) && @logger.tty?
        "#{ansi_color}#{text}\e[0m"
      else
        text
      end
    end

    def log(text)
      if @logger
        @logger.info(text)
      end
    end

    def class_path
      clazz.path
    end

    def path_prefix
      if !class_path.nil? && !class_path.empty?
        os_path_prefix
      end
    end

    def os_path_prefix
      if OS.unix?
        unix_path_prefix
      else
        windows_path_prefix
      end
    end

    def unix_path_prefix
      "PATH=#{self.class.path}#{OS.path_separator}$PATH;"
    end

    def windows_path_prefix
      "SET PATH=#{self.class.path}#{OS.path_separator}%PATH% &"
    end

    def execute(command)
      runner.call(command, environment, runner_options)
    end

    def environment
      self.class.environment.merge(@environment)
    end

    def runner_options
      self.class.runner_options.merge(@runner_options)
    end

    def interpolate(pattern, interpolations)
      interpolations = Utility.stringify_keys(interpolations)
      pattern.gsub(/:\{?(\w+)\b\}?/) do |match|
        key = match.tr(":{}", "")
        if interpolations.key?(key)
          shell_quote_all_values(interpolations[key])
        else
          match
        end
      end
    end


    def shell_quote_all_values(values)
      Array(values).map(&Utility.method(:shell_quote)).join(" ")
    end

  end
end
