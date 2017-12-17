## Code smells

      lib/cocaine/command_line.rb -- 28 warnings:
        [6]:Attribute: Cocaine::CommandLine#logger is a writable attribute [https://github.com/troessner/reek/blob/master/docs/Attribute.md]
        [6]:Attribute: Cocaine::CommandLine#runner is a writable attribute [https://github.com/troessner/reek/blob/master/docs/Attribute.md]
        [60, 61]:DuplicateMethodCall: Cocaine::CommandLine#initialize calls 'self.class' 2 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
        [130, 130]:DuplicateMethodCall: Cocaine::CommandLine#path_prefix calls 'self.class' 2 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
        [130, 130]:DuplicateMethodCall: Cocaine::CommandLine#path_prefix calls 'self.class.path' 2 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
        [4]:InstanceVariableAssumption: Cocaine::CommandLine assumes too much for instance variable '@exit_status' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
        [4]:InstanceVariableAssumption: Cocaine::CommandLine assumes too much for instance variable '@output' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
        [4]:InstanceVariableAssumption: Cocaine::CommandLine assumes too much for instance variable '@supplemental_path' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
        [4]:IrresponsibleModule: Cocaine::CommandLine has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
        [116]:ManualDispatch: Cocaine::CommandLine#colored manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
        [83]:ManualDispatch: Cocaine::CommandLine#run manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
        [185]:ManualDispatch: Cocaine::CommandLine#shell_quote manually dispatches method call [https://github.com/troessner/reek/blob/master/docs/Manual-Dispatch.md]
        [130]:NilCheck: Cocaine::CommandLine#path_prefix performs a nil-check [https://github.com/troessner/reek/blob/master/docs/Nil-Check.md]
        [184]:NilCheck: Cocaine::CommandLine#shell_quote performs a nil-check [https://github.com/troessner/reek/blob/master/docs/Nil-Check.md]
        [30]:PrimaDonnaMethod: Cocaine::CommandLine has prima donna method 'fake!' [https://github.com/troessner/reek/blob/master/docs/Prima-Donna-Method.md]
        [34]:PrimaDonnaMethod: Cocaine::CommandLine has prima donna method 'unfake!' [https://github.com/troessner/reek/blob/master/docs/Prima-Donna-Method.md]
        [136, 187, 199]:RepeatedConditional: Cocaine::CommandLine tests 'OS.unix?' at least 3 times [https://github.com/troessner/reek/blob/master/docs/Repeated-Conditional.md]
        [4]:TooManyInstanceVariables: Cocaine::CommandLine has at least 12 instance variables [https://github.com/troessner/reek/blob/master/docs/Too-Many-Instance-Variables.md]
        [4]:TooManyMethods: Cocaine::CommandLine has at least 29 methods [https://github.com/troessner/reek/blob/master/docs/Too-Many-Methods.md]
        [74]:TooManyStatements: Cocaine::CommandLine#run has approx 11 statements [https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md]
        [183]:TooManyStatements: Cocaine::CommandLine#shell_quote has approx 6 statements [https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md]
        [80]:UncommunicativeVariableName: Cocaine::CommandLine#run has the variable name 'e' [https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md]
        [191]:UncommunicativeVariableName: Cocaine::CommandLine#shell_quote has the variable name 'm' [https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md]
        [176]:UncommunicativeVariableName: Cocaine::CommandLine#stringify_keys has the variable name 'k' [https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md]
        [176]:UncommunicativeVariableName: Cocaine::CommandLine#stringify_keys has the variable name 'v' [https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md]
        [198]:UtilityFunction: Cocaine::CommandLine#bit_bucket doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
        [183]:UtilityFunction: Cocaine::CommandLine#shell_quote doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
        [175]:UtilityFunction: Cocaine::CommandLine#stringify_keys doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
## Refactorings:

#### 1. [DuplicateMethodCall](https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md)
    
    def initialize(binary, params = "", options = {})
        @binary            = binary.dup
        @params            = params.dup
        @options           = options.dup
        @runner            = @options.delete(:runner) || self.class.runner
        @logger            = @options.delete(:logger) || self.class.logger
        @swallow_stderr    = @options.delete(:swallow_stderr)
        @expected_outcodes = @options.delete(:expected_outcodes) || [0]
        @environment       = @options.delete(:environment) || {}
        @runner_options    = @options.delete(:runner_options) || {}
    end

    
DuplicateMethodCall: Cocaine::CommandLine#initialize calls 'self.class' 2 times 

**Solution**: 
- Introduce helper method   

    
        def clazz
            self.class
        end
        
        def initialize(binary, params = "", options = {})
            @binary            = binary.dup
            @params            = params.dup
            @options           = options.dup
            @runner            = @options.delete(:runner) || clazz.runner
            @logger            = @options.delete(:logger) || clazz.logger
            @swallow_stderr    = @options.delete(:swallow_stderr)
            @expected_outcodes = @options.delete(:expected_outcodes) || [0]
            @environment       = @options.delete(:environment) || {}
            @runner_options    = @options.delete(:runner_options) || {}
        end

### 2. [DuplicateMethodCall](https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md)

DuplicateMethodCall: Cocaine::CommandLine#path_prefix calls 'self.class.path' 2 times  
    
    def path_prefix
        if !self.class.path.nil? && !self.class.path.empty?
            os_path_prefix
        end
    end
    

**Solution**:   
- Remove method from class and replace its usage with helper method 
            
            
            
        def class_path
          clazz.path
        end
        
        def path_prefix
            if !class_path.nil? && !class_path.empty?
                os_path_prefix
            end
        end
    
### 3. [InstanceVariableAssumption](https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md)

InstanceVariableAssumption: Cocaine::CommandLine assumes too much for instance variable '@supplemental_path' 
    
     def path
        @supplemental_path
     end
    


**Solution**: 
- Provide default value
            
                   
     def path
        @supplemental_path ||= {}
     end

### 4. [InstanceVariableAssumption](https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md)

InstanceVariableAssumption: Cocaine::CommandLine assumes too much for instance variable '@output'
    
     def output
         @output || Output.new
     end
   

**Solution**: 
- Provide default value   
            
                    
     def output
          @output ||= Output.new
     end

    
### 5. [PrimaDonnaMethod](https://github.com/troessner/reek/blob/master/docs/Prima-Donna-Method.md)

PrimaDonnaMethod: Cocaine::CommandLine has prima donna method 'fake!'
    
     def fake
       @runner = FakeRunner.new
     end
   
     def fake!
       @runner = FakeRunner.new
     end

   

**Solution**: 
- Provide method 'fake', alternative without '!' which should be safe to use.     
            
                    
    def fake
        @runner = FakeRunner.new
    end
    
    def fake!
        @runner = FakeRunner.new
    end
    
### 6. [PrimaDonnaMethod](https://github.com/troessner/reek/blob/master/docs/Prima-Donna-Method.md)

PrimaDonnaMethod: Cocaine::CommandLine has prima donna method 'unfake!' 
    
    def unfake
        @runner = nil
    end
    
    def unfake!
        @runner = nil
    end
    
**Solution**: 
- Provide method 'unfake', alternative without '!' which should be safe to use.   

                    
    def fake
        @runner = FakeRunner.new
    end
    
    def fake!
        @runner = FakeRunner.new
    end
    
### 7. [UtilityFunction](https://github.com/troessner/reek/blob/master/docs/Utility-Function.md)
    
UtilityFunction: Cocaine::CommandLine#bit_bucket doesn't depend on instance state (maybe move it to another class?)    

     def command(interpolations = {})
         cmd = [path_prefix, @binary, interpolate(@params, interpolations)]
         cmd << bit_bucket if @swallow_stderr
         cmd.join(" ").strip
     end

     def bit_bucket
          OS.unix? ? "2>/dev/null" : "2>NUL"
     end
     

**Solution**: 
- Copy bit_bucket method to utility class and remove it from CommandLine class.  

            
     def command(interpolations = {})
          cmd = [path_prefix, @binary, interpolate(@params, interpolations)]
          cmd << Utility.bit_bucket if @swallow_stderr
          cmd.join(" ").strip
     end
     
     class Utility
         ...
         def self.bit_bucket
           OS.unix? ? "2>/dev/null" : "2>NUL"
         end
     end
    
### 7. [RepeatedConditional](https://github.com/troessner/reek/blob/master/docs/Repeated-Conditional.md)

Cocaine::CommandLine tests 'OS.unix?' at least 3 times
    
     def bit_bucket
          OS.unix? ? "2>/dev/null" : "2>NUL"
     end
     

**Solution**: 
- Copy bit_bucket method to utility class and remove it from CommandLine class. (already done)   
     
     
     class Utility
         def self.bit_bucket
           OS.unix? ? "2>/dev/null" : "2>NUL"
         end
     end
    
### 8. [UncommunicativeVariableName](https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md)

Cocaine::CommandLine#run has the variable name 'e'
    
     def run(interpolations = {})
        @exit_status = nil
        begin
            full_command = command(interpolations)
            log("#{colored("Command")} :: #{full_command}")
            @output = execute(full_command)
        rescue Errno::ENOENT => e
            raise Cocaine::CommandNotFoundError, e.message
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
     

**Solution**: 
- Change variable name to be more descriptive.  
     
     
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
    
### 9. [UtilityFunction](https://github.com/troessner/reek/blob/master/docs/Utility-Function.md)
Cocaine::CommandLine#shell_quote doesn't depend on instance state (maybe move it to another class?)
    
    def shell_quote_all_values(values)
        Array(values).map(&method(:shell_quote)).join(" ")
    end
          
    def shell_quote(string)
        return "" if string.nil?
        string = string.to_s if string.respond_to? :to_s
        if OS.unix?
          if string.empty?
            "''"
          else
            string.split("'", -1).map { |m| "'#{m}'" }.join("\\'")
          end
        else
          %{"#{string}"}
        end
    end
     

**Solution**:
- Move method to Utility class. 
     

     def shell_quote_all_values(values)
          Array(values).map(&Utility.method(:shell_quote)).join(" ")
     end
    

### 10. [UtilityFunction](https://github.com/troessner/reek/blob/master/docs/Utility-Function.md)

UtilityFunction: Cocaine::CommandLine#stringify_keys doesn't depend on instance state (maybe move it to another class?)
    
     def interpolate(pattern, interpolations)
       interpolations = stringify_keys(interpolations)
       pattern.gsub(/:\{?(\w+)\b\}?/) do |match|
         key = match.tr(":{}", "")
         if interpolations.key?(key)
           shell_quote_all_values(interpolations[key])
         else
           match
         end
       end
     end

**Solution**: 
- Move method to Utility class.    


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
Done