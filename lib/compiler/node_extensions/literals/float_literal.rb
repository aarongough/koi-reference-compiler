include KoiVM

module MinKoi

  class FloatLiteral
    def compile
      [ PUSH_FLOAT, self.text_value.to_f ]
    end
  end
  
end