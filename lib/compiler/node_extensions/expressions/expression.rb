include KoiVM

module MinKoi

  class Expression
    def compile
      return self.elements.first.compile
    end
  end
  
end