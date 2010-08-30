module KoiReferenceCompiler

  class NilLiteral
    def compile
      [ PUSH_NIL ]
    end
  end
  
end