module KoiReferenceCompiler

  class IntegerLiteral < SyntaxNode
    def compile
      [ PUSH_INT, self.text_value.to_i ]
    end
  end
  
end