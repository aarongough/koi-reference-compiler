module KoiReferenceCompiler

  class InequalityOperator < SyntaxNode
    def compile
      [ EQUAL, INVERT ]
    end
  end
  
end