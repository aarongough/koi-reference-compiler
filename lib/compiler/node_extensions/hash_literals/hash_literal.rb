include KoiVM

module MinKoi

  class HashLiteral
    def compile
      bytecode = [PUSH_HASH]
      bytecode.concat( self.elements.first.compile )
      return bytecode
    end
  end
  
end