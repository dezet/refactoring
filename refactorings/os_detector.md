## Code smells

    lib/cocaine/os_detector.rb -- 2 warnings:
      [4]:IrresponsibleModule: Cocaine::OSDetector has no descriptive comment [https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md]
      [9]:UtilityFunction: Cocaine::OSDetector#unix? doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
## Refactorings:

#### 1. [Irresponsible Module](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)

Cocaine::OSDetector has no descriptive comment 
      
       class OSDetector
        ...
       end


**Solution**:   
- Add descriptive comment 
  
 
     # Class responsible for detecting environment settings
      class OSDetector
       ...
      end
    
Done