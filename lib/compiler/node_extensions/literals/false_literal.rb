module KoiReferenceCompiler

  class FalseLiteral
    def compile
      [ PUSH_BOOL, false ]
    end
  end
  
end