include KoiVM

module MinKoi

  class Assignment
    def compile
      bytecode = []
      bytecode.concat( self.elements[2].compile )
      bytecode.concat( self.elements[0].compile )
      return bytecode
    end
  end
  
end