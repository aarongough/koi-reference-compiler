include KoiVM

module MinKoi

  class Identifier
    def compile
      identifier = self.text_value
      parent = self.parent
      if(identifier[0] == "$")
        if(parent.is_a?(Expression) || parent.is_a?(MultitiveExpression) || parent.is_a?(AdditiveExpression) || parent.is_a?(ComparativeExpression) || parent.is_a?(HashAssignment) || parent.is_a?(HashAccess))
          [ GET_GLOBAL, identifier.to_sym ]
          
        elsif(parent.is_a?(Assignment) || parent.is_a?(FunctionDefinition))
          [ SET_GLOBAL, identifier.to_sym ]
          
        else
          raise CompileError, "Unkown parent for Identfier: #{self.parent.class}"        
        end
      else
        if(parent.is_a?(Expression) || parent.is_a?(MultitiveExpression) || parent.is_a?(AdditiveExpression) || parent.is_a?(ComparativeExpression) || parent.is_a?(HashAssignment) || parent.is_a?(HashAccess))
          [ GET_LOCAL, identifier.to_sym ]
          
        elsif(parent.is_a?(Assignment) || parent.is_a?(FunctionDefinition))
          [ SET_LOCAL, identifier.to_sym ]
          
        else
          raise CompileError, "Unkown parent for Identfier: #{self.parent.class}"
        end
      end
    end
  end
  
end