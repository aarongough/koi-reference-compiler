module KoiReferenceCompiler

  class Expression < SyntaxNode
    def compile
      return self.elements.first.compile
    end
  end
  
end