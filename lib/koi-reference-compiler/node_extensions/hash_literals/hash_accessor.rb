module KoiReferenceCompiler

  class HashAccessor < SyntaxNode
    def compile_get
      bytecode = self.elements.first.compile
      bytecode << GET_KEY
    end
    
    def compile_set
      bytecode = self.elements.first.compile
      bytecode << SET_KEY
    end
  end
  
end