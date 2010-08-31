module KoiReferenceCompiler

  class SubtractionOperator < SyntaxNode
    def compile
      [ SUBTRACT ]
    end
  end
  
end