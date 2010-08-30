module KoiReferenceCompiler

  class Statement
    def compile
      return self.elements.first.compile
    end
  end
  
end