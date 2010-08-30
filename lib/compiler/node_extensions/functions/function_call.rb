module KoiReferenceCompiler

  class FunctionCall
    def compile
      number_of_arguments = self.elements.length - 1
    
      bytecode = []
      bytecode.concat( self.elements[2].compile ) if(number_of_arguments > 1)
      bytecode.concat( self.elements[1].compile ) if(number_of_arguments > 0)
      
      function_name = self.elements.first.text_value
      
      if( function_name == "print")
        raise_error unless(number_of_arguments == 1)
        bytecode << PRINT
        
      elsif( function_name == "gets")
        raise_error unless(number_of_arguments == 0)
        bytecode << GETS
        
      elsif( function_name == "call")
        raise_error unless(number_of_arguments == 2)
        bytecode << CALL
        
      elsif( function_name == "tailcall")
        raise_error unless(number_of_arguments == 1 || number_of_arguments == 2)
        bytecode << TAILCALL
        
      elsif( function_name == "return")
        raise_error unless(number_of_arguments == 0 || number_of_arguments == 1)
        bytecode << RETURN
        
      elsif( function_name == "to_string")
        raise_error unless(number_of_arguments == 1)
        bytecode <<  TO_STRING
        
      elsif( function_name == "type_of")
        raise_error unless(number_of_arguments == 1)
        bytecode << TYPEOF
        
      else
        raise CompileError, "Unknown function: #{function_name} at offset: #{self.elements.first.interval.first}"
      end
    end
    
    private
    
      def raise_error()
        function_name = self.elements.first.text_value
        raise CompileError, "Wrong number of arguments for: #{function_name}() at offset: #{self.elements.first.interval.first}"
      end
  end
  
end