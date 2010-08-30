module KoiReferenceCompiler

  class InequalityOperator
    def compile
      [ EQUAL, INVERT ]
    end
  end
  
end