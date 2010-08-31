module KoiReferenceCompiler

  class Compiler
    
    def self.compile(ast_hash)
      tree = self.load_ast_hash(ast_hash)
      bytecode = tree.compile
      return bytecode
    end
    
    def self.load_ast_hash(hash)
      unless(hash[:elements].nil?)
        elements = hash[:elements].map {|x| self.load_ast_hash(x) }
      else
        elements = nil
      end
      tree = Kernel.const_get("KoiReferenceCompiler").const_get(hash[:name]).new(hash[:text_value], hash[:offset], elements)
      return tree
    end
    
  end
  
end