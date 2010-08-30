module KoiReferenceCompiler

  class Compiler
    
    def self.compile(tree)
      bytecode = tree.compile
      return bytecode
    end
    
  end
  
end