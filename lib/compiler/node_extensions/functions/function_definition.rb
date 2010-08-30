include KoiVM

module MinKoi

  class FunctionDefinition
    def compile
      function_id = self.interval.first
      bytecode = [
        PUSH_FUNCTION, function_id
      ]
      bytecode.concat( self.elements[0].compile )
      bytecode.concat( self.elements[1].compile )
      bytecode.concat([
        RETURN,
        END_FUNCTION, 0,
        END_FUNCTION, function_id
      ])
    end
  end
  
end