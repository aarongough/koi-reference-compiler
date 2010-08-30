include KoiVM

module MinKoi

  class HashAccess
    def compile
      bytecode = []
      bytecode.concat( self.elements[0].compile )
      bytecode.concat( self.elements[1].compile )
      return bytecode
    end
  end
  
end