require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class AdditiveExpressionTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile AdditiveExpression" do
    tree = AdditiveExpression.new("1 + 2", 0, [
      IntegerLiteral.new("1", 0),
      AdditionOperator.new("+", 2),
      IntegerLiteral.new("2", 4)
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      PUSH_INT, 2, 
      ADD
    ], bytecode
  end
  
end