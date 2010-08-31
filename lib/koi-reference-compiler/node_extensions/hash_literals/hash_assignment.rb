module KoiReferenceCompiler

  class HashAssignment < SyntaxNode
    def compile
      expression = self.elements[3].compile
    
      bytecode = []
      bytecode.concat( self.elements[0].compile )
      bytecode.concat( self.elements[1].compile )
      tmp = bytecode.slice!(-2,2)
      bytecode.concat( expression )
      bytecode.concat( tmp )
      return bytecode
    end
  end
  
end