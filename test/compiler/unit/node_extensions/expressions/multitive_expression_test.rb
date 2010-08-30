require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class MultitiveExpressionTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile MultitiveExpression" do
    elements = [
      IntegerLiteral.new("test = 1 * 2", 7...8),
      MultiplicationOperator.new("test = 1 * 2", 9...10),
      IntegerLiteral.new("test = 1 * 2", 11..12)
    ]
    tree = MultitiveExpression.new("test = 1 * 2", 7...12, elements)
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      PUSH_INT, 2, 
      MULTIPLY
    ], bytecode
  end
  
end