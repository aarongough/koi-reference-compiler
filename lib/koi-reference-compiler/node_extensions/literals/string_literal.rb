module KoiReferenceCompiler

  class StringLiteral < SyntaxNode
    def compile
      [ PUSH_STRING, self.text_value.slice(1, self.text_value.length - 2) ]
    end
  end
  
end