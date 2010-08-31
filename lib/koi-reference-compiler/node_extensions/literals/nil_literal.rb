module KoiReferenceCompiler

  class NilLiteral < SyntaxNode
    def compile
      [ PUSH_NIL ]
    end
  end
  
end