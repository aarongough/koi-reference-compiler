module KoiReferenceCompiler

  class Expression
    def compile
      return self.elements.first.compile
    end
  end
  
end