## Code smells

    lib/cocaine/command_line/runners/fake_runner.rb -- 2 warnings:
      [5]:IrresponsibleModule: Cocaine::CommandLine::FakeRunner has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      [20]:UnusedParameters: Cocaine::CommandLine::FakeRunner#call has unused parameter 'options' [https://github.com/troessner/reek/blob/master/docs/Unused-Parameters.md]
## Refactorings:

#### 1. [Irresponsible Module](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)
Cocaine::CommandLine::FakeRunner has no descriptive comment 
     
    class CommandLine
        class FakeRunner
          ...
        end
      

    
Cocaine::CommandLine::BackticksRunner has no descriptive comment

**Solution**: Add descriptive comment  
**Steps:**
- Add comment before class. 
  
 
    class CommandLine
        # Class representing for fake running (test purposes)
        class FakeRunner
          ...
        end
      end

Done