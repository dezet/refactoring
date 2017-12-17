## Code smells

    lib/cocaine/command_line/multi_pipe.rb -- 6 warnings:
      [5, 6]:DuplicateMethodCall: Cocaine::CommandLine::MultiPipe#initialize calls 'IO.pipe' 2 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
      [3]:InstanceVariableAssumption: Cocaine::CommandLine::MultiPipe assumes too much for instance variable '@stderr_output' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
      [3]:InstanceVariableAssumption: Cocaine::CommandLine::MultiPipe assumes too much for instance variable '@stdout_output' [https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md]
      [3]:IrresponsibleModule: Cocaine::CommandLine::MultiPipe has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      [3]:TooManyInstanceVariables: Cocaine::CommandLine::MultiPipe has at least 6 instance variables [https://github.com/troessner/reek/blob/master/docs/Too-Many-Instance-Variables.md]
      [41]:UtilityFunction: Cocaine::CommandLine::MultiPipe#read_stream doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]

## Refactorings:

#### 1. [Irresponsible Module](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)
     module Cocaine
       class CommandLine
         class MultiPipe
           def initialize
             @stdout_in, @stdout_out = IO.pipe
             @stderr_in, @stderr_out = IO.pipe
           end
     
           def pipe_options
             { out: @stdout_out, err: @stderr_out }
           end
     
           def output
             Output.new(@stdout_output, @stderr_output)
           end
     
           def read_and_then(&block)
             close_write
             read
             block.call
             close_read
           end
     
           private
     
           def close_write
             @stdout_out.close
             @stderr_out.close
           end
     
           def read
             @stdout_output = read_stream(@stdout_in)
             @stderr_output = read_stream(@stderr_in)
           end
     
           def close_read
             @stdout_in.close
             @stderr_in.close
           end
     
           def read_stream(io)
             result = ""
             while partial_result = io.read(8192)
               result << partial_result
             end
             result
           end
         end
       end
     end
    
`class MultiPipe` has method

**Solution**: Add descriptive comment  
**Steps:**: 1 Add comment before class. 
            
    module Cocaine
      class CommandLine
        # Class responsible for piping commands
        class MultiPipe
          def initialize
            @stdout_in, @stdout_out = IO.pipe
            @stderr_in, @stderr_out = IO.pipe
          end
    
          def pipe_options
            {out: @stdout_out, err: @stderr_out}
          end
    
          def output
            Output.new(@stdout_output, @stderr_output)
          end
    
          def read_and_then(&block)
            close_write
            read
            block.call
            close_read
          end
    
          private
    
          def close_write
            @stdout_out.close
            @stderr_out.close
          end
    
          def read
            @stdout_output = read_stream(@stdout_in)
            @stderr_output = read_stream(@stderr_in)
          end
    
          def close_read
            @stdout_in.close
            @stderr_in.close
          end
    
          def read_stream(io)
            result = ""
            while partial_result = io.read(8192)
              result << partial_result
            end
            result
          end
        end
      end
    end
### 2. [UtilityFunction](https://github.com/troessner/reek/blob/master/docs/Utility-Function.md)
     module Cocaine
       class CommandLine
         # Class responsible for piping commands
         class MultiPipe
           def initialize
             @stdout_in, @stdout_out = IO.pipe
             @stderr_in, @stderr_out = IO.pipe
           end
     
           def pipe_options
             {out: @stdout_out, err: @stderr_out}
           end
     
           def output
             Output.new(@stdout_output, @stderr_output)
           end
     
           def read_and_then(&block)
             close_write
             read
             block.call
             close_read
           end
     
           private
     
           def close_write
             @stdout_out.close
             @stderr_out.close
           end
     
           def read
             @stdout_output = read_stream(@stdout_in)
             @stderr_output = read_stream(@stderr_in)
           end
     
           def close_read
             @stdout_in.close
             @stderr_in.close
           end
     
           def read_stream(io)
             result = ""
             while partial_result = io.read(8192)
               result << partial_result
             end
             result
           end
         end
       end
     end
    
`class MultiPipe` read_stream method doesn't depend on instance state 

**Solution**: Extract method to utility class
**Steps:**:  
- Remove method from class and replace its usaged with utility class
            
    
    module Cocaine
      class CommandLine
        # Class responsible for piping commands
        class MultiPipe
          def initialize
            @stdout_in, @stdout_out = IO.pipe
            @stderr_in, @stderr_out = IO.pipe
          end
    
          def pipe_options
            {out: @stdout_out, err: @stderr_out}
          end
    
          def output
            Output.new(@stdout_output, @stderr_output)
          end
    
          def read_and_then(&block)
            close_write
            read
            block.call
            close_read
          end
    
          private
    
          def close_write
            @stdout_out.close
            @stderr_out.close
          end
    
          def read
            @stdout_output = Utility.read_stream(@stdout_in)
            @stderr_output = Utility.read_stream(@stderr_in)
          end
    
          def close_read
            @stdout_in.close
            @stderr_in.close
          end
    
    
        end
      end
    end
    
Done