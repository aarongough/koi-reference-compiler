module KoiReferenceCompiler
  
  class SyntaxNode
    
    attr_accessor :parent, :elements, :offset, :text_value
    
    def initialize(text_value, offset, elements = nil)
      @parent = nil
      @elements = elements
      @offset = offset
      @text_value = text_value
      elements.each do |element|
        element.parent = self
      end unless(elements.nil?)
    end
  end
  
end