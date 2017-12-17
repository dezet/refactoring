## Code smells

    lib/cocaine/command_line/runners/backticks_runner.rb -- 3 warnings:
      [7]:IrresponsibleModule: Cocaine::CommandLine::BackticksRunner has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      [16]:UnusedParameters: Cocaine::CommandLine::BackticksRunner#call has unused parameter 'options' [https://github.com/troessner/reek/blob/master/docs/Unused-Parameters.md]
      [24]:UtilityFunction: Cocaine::CommandLine::BackticksRunner#with_modified_environment doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
## Refactorings:

#### 1. [Irresponsible Module](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)
     # coding: UTF-8
     
     require 'climate_control'
     
     module Cocaine
       class CommandLine
         class BackticksRunner
          ...
         end
       end
     end

    
Cocaine::CommandLine::BackticksRunner has no descriptive comment

**Solution**: Add descriptive comment  
**Steps:**
- Add comment before class. 
  
 
    module Cocaine
      class CommandLine
        # Class responsible for running commands in backticks
        class BackticksRunner
         ...
        end
      end
    end

### 2. [UtilityFunction](https://github.com/troessner/reek/blob/master/docs/Utility-Function.md)
      module Cocaine
           class CommandLine
             # Class responsible for running commands in backticks
             class BackticksRunner
               def self.supported?
                 true
               end
         
               def supported?
                 self.class.supported?
               end
         
               def call(command, env = {}, options = {})
                 with_modified_environment(env) do
                   Output.new(`#{command}`)
                 end
               end
         
               private
         
               def with_modified_environment(env, &block)
                 ClimateControl.modify(env, &block)
               end
         
             end
           end
         end
    
`class MultiPipe` with_modified_environment method doesn't depend on instance state 

**Solution**: Extract method to utility class.  
**Steps:**
- Remove method from class and replace its usaged with utility class
            
    
    module Cocaine
      class CommandLine
        # Class responsible for running commands in backticks
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
Done