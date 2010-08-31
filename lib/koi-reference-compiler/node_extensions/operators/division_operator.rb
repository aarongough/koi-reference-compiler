module KoiReferenceCompiler

  class DivisionOperator < SyntaxNode
    def compile
      [ DIVIDE ]
    end
  end
  
end