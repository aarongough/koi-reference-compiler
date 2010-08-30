include KoiVM

module MinKoi

  class InequalityOperator
    def compile
      [ EQUAL, INVERT ]
    end
  end
  
end