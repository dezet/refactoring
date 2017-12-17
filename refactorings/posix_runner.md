## Code smells

    lib/cocaine/command_line/runners/posix_runner.rb -- 5 warnings:
      [22, 23, 26]:FeatureEnvy: Cocaine::CommandLine::PosixRunner#call refers to 'pipe' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Feature-Envy.md]
      [5]:IrresponsibleModule: Cocaine::CommandLine::PosixRunner has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      [7]:NilCheck: Cocaine::CommandLine::PosixRunner#self.available? performs a nil-check [https://github.com/troessner/reek/blob/master/docs/Nil-Check.md]
      [31]:UtilityFunction: Cocaine::CommandLine::PosixRunner#spawn doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
      [35]:UtilityFunction: Cocaine::CommandLine::PosixRunner#waitpid doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
## Refactorings:

#### 1. [Irresponsible Module](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)
Cocaine::CommandLine::BackticksRunner has no descriptive comment      
     
     
         class ProcessRunner
          ...
         end


**Solution**: 
- Add comment before class.  
  
  
     # Class responsible for running commands as processes.
        class ProcessRunner
         ...
        end
    
    
Done