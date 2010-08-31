module KoiReferenceCompiler

  class LessThanOperator < SyntaxNode
    def compile
      [ LESS_THAN ]
    end
  end
  
end