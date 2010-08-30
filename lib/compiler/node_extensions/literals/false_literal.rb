include KoiVM

module MinKoi

  class FalseLiteral
    def compile
      [ PUSH_BOOL, false ]
    end
  end
  
end