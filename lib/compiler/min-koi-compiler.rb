class MinKoiCompiler

  require 'koi-vm'
  include KoiVM
  
  def self.compile(tree)
    bytecode = tree.compile
    return bytecode
  end
  
end