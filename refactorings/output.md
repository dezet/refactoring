## Code smells
    lib/cocaine/command_line/output.rb -- 1 warning:
     [1]:IrresponsibleModule: Cocaine::CommandLine::Output has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]

## Refactorings:

#### 1. [Irresponsible Module](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)

Cocaine::CommandLine::Output has no descriptive comment 

    class Cocaine::CommandLine::Output
      def initialize(output = nil, error_output = nil)
        @output = output
        @error_output = error_output
      end
    
      attr_reader :output, :error_output
    
      def to_s
        output.to_s
      end
    end
    

**Solution**:  
- Add comment before class. 
    
  
    # Class responsible for writing to console    
    class Cocaine::CommandLine::Output
      def initialize(output = nil, error_output = nil)
        @output = output
        @error_output = error_output
      end
    
      attr_reader :output, :error_output
    
      def to_s
        output.to_s
      end
    end
Done