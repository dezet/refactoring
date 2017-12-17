## Summary

##1. Before 

      domc1o@MacBook-Pro-Dominik:/var/www/cocaine_clone/cocaine$ reek -f json lib | jq .[].wiki_link -r  | sort | uniq -c | sort -n
      
         1 https://github.com/troessner/reek/blob/master/docs/Repeated-Conditional.md
         1 https://github.com/troessner/reek/blob/master/docs/Too-Many-Methods.md
         2 https://github.com/troessner/reek/blob/master/docs/Attribute.md
         2 https://github.com/troessner/reek/blob/master/docs/Feature-Envy.md
         2 https://github.com/troessner/reek/blob/master/docs/Prima-Donna-Method.md
         2 https://github.com/troessner/reek/blob/master/docs/Too-Many-Instance-Variables.md
         2 https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md
         2 https://github.com/troessner/reek/blob/master/docs/Unused-Parameters.md
         3 https://github.com/troessner/reek/blob/master/docs/Nil-Check.md
         4 https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md
         4 https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md
         4 https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md
         5 https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md
        11 https://github.com/troessner/reek/blob/master/docs/Utility-Function.md
        14 https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md
      
      domc1o@MacBook-Pro-Dominik:/var/www/cocaine_clone/cocaine$ reek lib/
      Inspecting 13 file(s):
      SSSSSSS.SSS.S
      
      lib/cocaine/command_line/multi_pipe.rb -- 6 warnings:
        [5, 6]:DuplicateMethodCall: Cocaine::CommandLine::MultiPipe#initialize calls 'IO.pipe' 2 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
        [3]:InstanceVariableAssumption: Cocaine::CommandLine::MultiPipe assumes too much for instance variable '@stderr_output' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
        [3]:InstanceVariableAssumption: Cocaine::CommandLine::MultiPipe assumes too much for instance variable '@stdout_output' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
        [3]:IrresponsibleModule: Cocaine::CommandLine::MultiPipe has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [3]:TooManyInstanceVariables: Cocaine::CommandLine::MultiPipe has at least 6 instance variables [https://github.com/troessner/reek/blob/master/docs/Too-Many-Instance-Variables.md]
        [41]:UtilityFunction: Cocaine::CommandLine::MultiPipe#read_stream doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
      lib/cocaine/command_line/output.rb -- 1 warning:
        [1]:IrresponsibleModule: Cocaine::CommandLine::Output has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      lib/cocaine/command_line/runners/backticks_runner.rb -- 3 warnings:
        [7]:IrresponsibleModule: Cocaine::CommandLine::BackticksRunner has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [16]:UnusedParameters: Cocaine::CommandLine::BackticksRunner#call has unused parameter 'options' [https://github.com/troessner/reek/blob/master/docs/Unused-Parameters.md]
        [24]:UtilityFunction: Cocaine::CommandLine::BackticksRunner#with_modified_environment doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
      lib/cocaine/command_line/runners/fake_runner.rb -- 2 warnings:
        [5]:IrresponsibleModule: Cocaine::CommandLine::FakeRunner has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [20]:UnusedParameters: Cocaine::CommandLine::FakeRunner#call has unused parameter 'options' [https://github.com/troessner/reek/blob/master/docs/Unused-Parameters.md]
      lib/cocaine/command_line/runners/popen_runner.rb -- 2 warnings:
        [5]:IrresponsibleModule: Cocaine::CommandLine::PopenRunner has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [24]:UtilityFunction: Cocaine::CommandLine::PopenRunner#with_modified_environment doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
      lib/cocaine/command_line/runners/posix_runner.rb -- 5 warnings:
        [22, 23, 26]:FeatureEnvy: Cocaine::CommandLine::PosixRunner#call refers to 'pipe' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Feature-Envy.md]
        [5]:IrresponsibleModule: Cocaine::CommandLine::PosixRunner has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [7]:NilCheck: Cocaine::CommandLine::PosixRunner#self.available? performs a nil-check [https://github.com/troessner/reek/blob/master/docs/Nil-Check.md]
        [31]:UtilityFunction: Cocaine::CommandLine::PosixRunner#spawn doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
        [35]:UtilityFunction: Cocaine::CommandLine::PosixRunner#waitpid doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
      lib/cocaine/command_line/runners/process_runner.rb -- 5 warnings:
        [20, 21, 24]:FeatureEnvy: Cocaine::CommandLine::ProcessRunner#call refers to 'pipe' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Feature-Envy.md]
        [5]:IrresponsibleModule: Cocaine::CommandLine::ProcessRunner has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [7]:ManualDispatch: Cocaine::CommandLine::ProcessRunner#self.available? manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
        [29]:UtilityFunction: Cocaine::CommandLine::ProcessRunner#spawn doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
        [33]:UtilityFunction: Cocaine::CommandLine::ProcessRunner#waitpid doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
      lib/cocaine/command_line.rb -- 28 warnings:
        [6]:Attribute: Cocaine::CommandLine#logger is a writable attribute [https://github.com/troessner/reek/blob/master/docs/Attribute.md]
        [6]:Attribute: Cocaine::CommandLine#runner is a writable attribute [https://github.com/troessner/reek/blob/master/docs/Attribute.md]
        [55, 56]:DuplicateMethodCall: Cocaine::CommandLine#initialize calls 'self.class' 2 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
        [125, 125]:DuplicateMethodCall: Cocaine::CommandLine#path_prefix calls 'self.class' 2 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
        [125, 125]:DuplicateMethodCall: Cocaine::CommandLine#path_prefix calls 'self.class.path' 2 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
        [4]:InstanceVariableAssumption: Cocaine::CommandLine assumes too much for instance variable '@exit_status' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
        [4]:InstanceVariableAssumption: Cocaine::CommandLine assumes too much for instance variable '@output' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
        [4]:InstanceVariableAssumption: Cocaine::CommandLine assumes too much for instance variable '@supplemental_path' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
        [4]:IrresponsibleModule: Cocaine::CommandLine has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [111]:ManualDispatch: Cocaine::CommandLine#colored manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
        [78]:ManualDispatch: Cocaine::CommandLine#run manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
        [180]:ManualDispatch: Cocaine::CommandLine#shell_quote manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
        [125]:NilCheck: Cocaine::CommandLine#path_prefix performs a nil-check [https://github.com/troessner/reek/blob/master/docs/Nil-Check.md]
        [179]:NilCheck: Cocaine::CommandLine#shell_quote performs a nil-check [https://github.com/troessner/reek/blob/master/docs/Nil-Check.md]
        [30]:PrimaDonnaMethod: Cocaine::CommandLine has prima donna method 'fake!' [https://github.com/troessner/reek/blob/master/docs/Prima-Donna-Method.md]
        [34]:PrimaDonnaMethod: Cocaine::CommandLine has prima donna method 'unfake!' [https://github.com/troessner/reek/blob/master/docs/Prima-Donna-Method.md]
        [131, 182, 194]:RepeatedConditional: Cocaine::CommandLine tests 'OS.unix?' at least 3 times [https://github.com/troessner/reek/blob/master/docs/Repeated-Conditional.md]
        [4]:TooManyInstanceVariables: Cocaine::CommandLine has at least 12 instance variables [https://github.com/troessner/reek/blob/master/docs/Too-Many-Instance-Variables.md]
        [4]:TooManyMethods: Cocaine::CommandLine has at least 28 methods [https://github.com/troessner/reek/blob/master/docs/Too-Many-Methods.md]
        [69]:TooManyStatements: Cocaine::CommandLine#run has approx 11 statements [https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md]
        [178]:TooManyStatements: Cocaine::CommandLine#shell_quote has approx 6 statements [https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md]
        [75]:UncommunicativeVariableName: Cocaine::CommandLine#run has the variable name 'e' [https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md]
        [186]:UncommunicativeVariableName: Cocaine::CommandLine#shell_quote has the variable name 'm' [https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md]
        [171]:UncommunicativeVariableName: Cocaine::CommandLine#stringify_keys has the variable name 'k' [https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md]
        [171]:UncommunicativeVariableName: Cocaine::CommandLine#stringify_keys has the variable name 'v' [https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md]
        [193]:UtilityFunction: Cocaine::CommandLine#bit_bucket doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
        [178]:UtilityFunction: Cocaine::CommandLine#shell_quote doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
        [170]:UtilityFunction: Cocaine::CommandLine#stringify_keys doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
      lib/cocaine/exceptions.rb -- 4 warnings:
        [4]:IrresponsibleModule: Cocaine::CommandLineError has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [5]:IrresponsibleModule: Cocaine::CommandNotFoundError has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [6]:IrresponsibleModule: Cocaine::ExitStatusError has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [7]:IrresponsibleModule: Cocaine::InterpolationError has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      lib/cocaine/os_detector.rb -- 2 warnings:
        [4]:IrresponsibleModule: Cocaine::OSDetector has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [9]:UtilityFunction: Cocaine::OSDetector#unix? doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
      lib/cocaine.rb -- 1 warning:
        [11]:IrresponsibleModule: Cocaine has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      59 total warnings
      
      
      domc1o@MacBook-Pro-Dominik:/var/www/cocaine_clone/cocaine$ rake
      /Users/domc1o/.rvm/rubies/ruby-2.4.0/bin/ruby -I/Users/domc1o/.rvm/gems/ruby-2.4.0/gems/rspec-core-3.7.0/lib:/Users/domc1o/.rvm/gems/ruby-2.4.0/gems/rspec-support-3.7.0/lib /Users/domc1o/.rvm/gems/ruby-2.4.0/gems/rspec-core-3.7.0/exe/rspec --pattern spec/cocaine/\*\*/\*_spec.rb
      ..........................................................................
      
      Deprecation Warnings:
      
      Using `should` from rspec-expectations' old `:should` syntax without explicitly enabling the syntax is deprecated. Use the new `:expect` syntax or explicitly enable `:should` with `config.expect_with(:rspec) { |c| c.syntax = :should }` instead. Called from /private/var/www/cocaine_clone/cocaine/spec/cocaine/command_line/runners/backticks_runner_spec.rb:19:in `block (2 levels) in <top (required)>'.
      
      
      If you need more of the backtrace for any of these deprecations to
      identify where to make the necessary changes, you can configure
      `config.raise_errors_for_deprecations!`, and it will turn the
      deprecation warnings into errors, giving you the full backtrace.
      
      1 deprecation warning total
      
      Finished in 4.39 seconds (files took 0.33018 seconds to load)
      74 examples, 0 failures
      
      
      
##1. After 

      domc1o@MacBook-Pro-Dominik:/private/var/www/cocaine$ reek -f json lib | jq .[].wiki_link -r  | sort | uniq -c | sort -n
         1 https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md
         1 https://github.com/troessner/reek/blob/master/docs/Too-Many-Methods.md
         2 https://github.com/troessner/reek/blob/master/docs/Attribute.md
         2 https://github.com/troessner/reek/blob/master/docs/Too-Many-Instance-Variables.md
         2 https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md
         2 https://github.com/troessner/reek/blob/master/docs/Unused-Parameters.md
         3 https://github.com/troessner/reek/blob/master/docs/Feature-Envy.md
         3 https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md
         3 https://github.com/troessner/reek/blob/master/docs/Nil-Check.md
         4 https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md
         7 https://github.com/troessner/reek/blob/master/docs/Utility-Function.md


    domc1o@MacBook-Pro-Dominik:/private/var/www/cocaine$ reek lib/
    Inspecting 14 file(s):
    S.SSSSS.S.SS..
    
    lib/cocaine/command_line/multi_pipe.rb -- 4 warnings:
      [6, 7]:DuplicateMethodCall: Cocaine::CommandLine::MultiPipe#initialize calls 'IO.pipe' 2 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
      [4]:InstanceVariableAssumption: Cocaine::CommandLine::MultiPipe assumes too much for instance variable '@stderr_output' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
      [4]:InstanceVariableAssumption: Cocaine::CommandLine::MultiPipe assumes too much for instance variable '@stdout_output' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
      [4]:TooManyInstanceVariables: Cocaine::CommandLine::MultiPipe has at least 6 instance variables [https://github.com/troessner/reek/blob/master/docs/Too-Many-Instance-Variables.md]
    lib/cocaine/command_line/runners/backticks_runner.rb -- 2 warnings:
      [17]:UnusedParameters: Cocaine::CommandLine::BackticksRunner#call has unused parameter 'options' [https://github.com/troessner/reek/blob/master/docs/Unused-Parameters.md]
      [17]:UtilityFunction: Cocaine::CommandLine::BackticksRunner#call doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
    lib/cocaine/command_line/runners/fake_runner.rb -- 1 warning:
      [21]:UnusedParameters: Cocaine::CommandLine::FakeRunner#call has unused parameter 'options' [https://github.com/troessner/reek/blob/master/docs/Unused-Parameters.md]
    lib/cocaine/command_line/runners/popen_runner.rb -- 1 warning:
      [16]:UtilityFunction: Cocaine::CommandLine::PopenRunner#call doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
    lib/cocaine/command_line/runners/posix_runner.rb -- 4 warnings:
      [22, 23, 26]:FeatureEnvy: Cocaine::CommandLine::PosixRunner#call refers to 'pipe' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Feature-Envy.md]
      [8]:NilCheck: Cocaine::CommandLine::PosixRunner#self.available? performs a nil-check [https://github.com/troessner/reek/blob/master/docs/Nil-Check.md]
      [31]:UtilityFunction: Cocaine::CommandLine::PosixRunner#spawn doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
      [35]:UtilityFunction: Cocaine::CommandLine::PosixRunner#waitpid doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
    lib/cocaine/command_line/runners/process_runner.rb -- 4 warnings:
      [21, 22, 25]:FeatureEnvy: Cocaine::CommandLine::ProcessRunner#call refers to 'pipe' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Feature-Envy.md]
      [8]:ManualDispatch: Cocaine::CommandLine::ProcessRunner#self.available? manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
      [30]:UtilityFunction: Cocaine::CommandLine::ProcessRunner#spawn doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
      [34]:UtilityFunction: Cocaine::CommandLine::ProcessRunner#waitpid doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
    lib/cocaine/command_line.rb -- 10 warnings:
      [7]:Attribute: Cocaine::CommandLine#logger is a writable attribute [https://github.com/troessner/reek/blob/master/docs/Attribute.md]
      [7]:Attribute: Cocaine::CommandLine#runner is a writable attribute [https://github.com/troessner/reek/blob/master/docs/Attribute.md]
      [181, 182]:FeatureEnvy: Cocaine::CommandLine#interpolate refers to 'interpolations' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Feature-Envy.md]
      [5]:InstanceVariableAssumption: Cocaine::CommandLine assumes too much for instance variable '@exit_status' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
      [126]:ManualDispatch: Cocaine::CommandLine#colored manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
      [93]:ManualDispatch: Cocaine::CommandLine#run manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
      [144]:NilCheck: Cocaine::CommandLine#path_prefix performs a nil-check [https://github.com/troessner/reek/blob/master/docs/Nil-Check.md]
      [5]:TooManyInstanceVariables: Cocaine::CommandLine has at least 12 instance variables [https://github.com/troessner/reek/blob/master/docs/Too-Many-Instance-Variables.md]
      [5]:TooManyMethods: Cocaine::CommandLine has at least 29 methods [https://github.com/troessner/reek/blob/master/docs/Too-Many-Methods.md]
      [84]:TooManyStatements: Cocaine::CommandLine#run has approx 11 statements [https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md]
    lib/cocaine/os_detector.rb -- 1 warning:
      [10]:UtilityFunction: Cocaine::OSDetector#unix? doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
    lib/cocaine/utility.rb -- 3 warnings:
      [23]:ManualDispatch: Cocaine::Utility#self.shell_quote manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
      [22]:NilCheck: Cocaine::Utility#self.shell_quote performs a nil-check [https://github.com/troessner/reek/blob/master/docs/Nil-Check.md]
      [21]:TooManyStatements: Cocaine::Utility#self.shell_quote has approx 6 statements [https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md]
    30 total warnings
    
    domc1o@MacBook-Pro-Dominik:/var/www/cocaine_clone/cocaine$ rake
    /Users/domc1o/.rvm/rubies/ruby-2.4.0/bin/ruby -I/Users/domc1o/.rvm/gems/ruby-2.4.0/gems/rspec-core-3.7.0/lib:/Users/domc1o/.rvm/gems/ruby-2.4.0/gems/rspec-support-3.7.0/lib /Users/domc1o/.rvm/gems/ruby-2.4.0/gems/rspec-core-3.7.0/exe/rspec --pattern spec/cocaine/\*\*/\*_spec.rb
    ..........................................................................
    
    Deprecation Warnings:
    
    Using `should` from rspec-expectations' old `:should` syntax without explicitly enabling the syntax is deprecated. Use the new `:expect` syntax or explicitly enable `:should` with `config.expect_with(:rspec) { |c| c.syntax = :should }` instead. Called from /private/var/www/cocaine_clone/cocaine/spec/cocaine/command_line/runners/backticks_runner_spec.rb:19:in `block (2 levels) in <top (required)>'.
    
    
    If you need more of the backtrace for any of these deprecations to
    identify where to make the necessary changes, you can configure
    `config.raise_errors_for_deprecations!`, and it will turn the
    deprecation warnings into errors, giving you the full backtrace.
    
    1 deprecation warning total
    
    Finished in 4.39 seconds (files took 0.33018 seconds to load)
    74 examples, 0 failures

