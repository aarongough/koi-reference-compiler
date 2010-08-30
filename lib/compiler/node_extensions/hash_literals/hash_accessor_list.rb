module KoiReferenceCompiler

  class HashAccessorList
    def compile
      bytecode = []
      if(self.parent.is_a?(HashAssignment))
        self.elements.each_index do |x|
          if(x == self.elements.length - 1)
            bytecode.concat( self.elements[x].compile_set )
          else
            bytecode.concat( self.elements[x].compile_get )
          end
        end
        bytecode << POP
      elsif(self.parent.is_a?(HashAccess))
        self.elements.each do |x|
          bytecode.concat( x.compile_get )
        end
      else  
        raise CompileError, "Unkown parent for HashAccessorList: #{self.parent.class}"
      end
      return bytecode
    end
  end
  
end