module KoiReferenceCompiler

  class GreaterThanOperator < SyntaxNode
    def compile
      [ GREATER_THAN ]
    end
  end
  
end