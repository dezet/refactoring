## Code smells
    lib/cocaine/exceptions.rb -- 4 warnings:
      [4]:IrresponsibleModule: Cocaine::CommandLineError has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      [5]:IrresponsibleModule: Cocaine::CommandNotFoundError has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      [6]:IrresponsibleModule: Cocaine::ExitStatusError has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      [7]:IrresponsibleModule: Cocaine::InterpolationError has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]

## Refactorings:

#### 1. [Irresponsible Module](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)
Cocaine::CommandLine::Output has no descriptive comment 

       module Cocaine
         class CommandLineError < StandardError; end
         class CommandNotFoundError < CommandLineError; end
         class ExitStatusError < CommandLineError; end
         class InterpolationError < CommandLineError; end
       end
    

**Solution**:  
- Add comment describing exceptions.
    
    
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
Done