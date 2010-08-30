module KoiReferenceCompiler

  class KeyValue
    def compile
      bytecode = []
      bytecode.concat(self.elements[0].compile)
      bytecode.concat(self.elements[1].compile)
      bytecode << SET_KEY
      return bytecode
    end
  end
  
end