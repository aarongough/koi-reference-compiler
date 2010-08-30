require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class AdditiveExpressionTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile AdditiveExpression" do
    elements = [
      IntegerLiteral.new("test = 1 + 2", 7...8),
      AdditionOperator.new("test = 1 + 2", 9...10),
      IntegerLiteral.new("test = 1 + 2", 11..12)
    ]
    tree = AdditiveExpression.new("test = 1 + 2", 7...12, elements)
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      PUSH_INT, 2, 
      ADD
    ], bytecode
  end
  
end