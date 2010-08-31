module KoiReferenceCompiler

  class Unless < SyntaxNode
    def compile
      bytecode = self.elements[0].compile
      block = self.elements[1].compile
      bytecode.concat([
        JUMP_IF, block.length + 2
      ])
      bytecode.concat( block )
    end
  end
  
end