include KoiVM

module MinKoi

  class IntegerLiteral
    def compile
      [ PUSH_INT, self.text_value.to_i ]
    end
  end
  
end