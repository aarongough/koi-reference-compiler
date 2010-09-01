module KoiReferenceCompiler
  
  class SyntaxNode
    
    attr_accessor :parent, :elements, :offset, :text_value
    
    def initialize(text_value, offset, elements = nil)
      @parent = nil
      @elements = elements
      @offset = offset
      @text_value = text_value
      unless( elements.nil? )
        elements.each do |element|
          element.parent = self
        end
      end
    end
  end
  
end