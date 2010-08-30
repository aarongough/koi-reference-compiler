include KoiVM

module MinKoi

  class If
    def compile
      bytecode = self.elements[0].compile
      block = self.elements[1].compile
      bytecode.concat([
        JUMP_UNLESS, block.length + 2
      ])
      bytecode.concat( block )
    end
  end
  
end