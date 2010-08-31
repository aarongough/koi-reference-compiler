module KoiReferenceCompiler

  class TrueLiteral < SyntaxNode
    def compile
      [ PUSH_BOOL, true ]
    end
  end
  
end