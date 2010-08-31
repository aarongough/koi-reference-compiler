module KoiReferenceCompiler

  class MultiplicationOperator < SyntaxNode
    def compile
      [ MULTIPLY ]
    end
  end
  
end