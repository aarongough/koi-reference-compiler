module KoiReferenceCompiler

  class TrueLiteral
    def compile
      [ PUSH_BOOL, true ]
    end
  end
  
end