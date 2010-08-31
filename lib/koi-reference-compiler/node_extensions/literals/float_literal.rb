module KoiReferenceCompiler

  class FloatLiteral < SyntaxNode
    def compile
      [ PUSH_FLOAT, self.text_value.to_f ]
    end
  end
  
end