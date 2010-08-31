module KoiReferenceCompiler

  class FalseLiteral < SyntaxNode
    def compile
      [ PUSH_BOOL, false ]
    end
  end
  
end