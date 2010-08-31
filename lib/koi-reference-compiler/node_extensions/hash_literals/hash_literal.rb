module KoiReferenceCompiler

  class HashLiteral < SyntaxNode
    def compile
      bytecode = [PUSH_HASH]
      bytecode.concat( self.elements.first.compile )
      return bytecode
    end
  end
  
end