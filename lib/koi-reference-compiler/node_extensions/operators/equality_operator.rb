module KoiReferenceCompiler

  class EqualityOperator < SyntaxNode
    def compile
      [ EQUAL ]
    end
  end
  
end