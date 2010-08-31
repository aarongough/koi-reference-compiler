module KoiReferenceCompiler

  class KeyValueList < SyntaxNode
    def compile
      bytecode = []
      self.elements.each do |element|
        bytecode.concat(element.compile)
      end
      return bytecode
    end
  end
  
end