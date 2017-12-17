## Code smells

    lib/cocaine/command_line/runners/popen_runner.rb -- 2 warnings:
      [5]:IrresponsibleModule: Cocaine::CommandLine::PopenRunner has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      [24]:UtilityFunction: Cocaine::CommandLine::PopenRunner#with_modified_environment doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
## Refactorings:

#### 1. [Irresponsible Module](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)

Cocaine::CommandLine::PopenRunner has no descriptive comment
     
     module Cocaine
       class CommandLine
         class PopenRunner
           ...
         end
       end
     end

    
`class BackticksRunner` has no descriptive comment

**Solution**: Add descriptive comment  
**Steps:**
- Add comment before class. 
  
 
    module Cocaine
      class CommandLine
        # Class responsible for running commands using IO.popen with JRuby.
        # Should be used while getting error `unsupported spawn option: out` with JRuby.
        class PopenRunner
          ...
        end
      end
    end

Done