include KoiVM

module MinKoi

  class NilLiteral
    def compile
      [ PUSH_NIL ]
    end
  end
  
end