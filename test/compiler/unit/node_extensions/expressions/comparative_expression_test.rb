require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class ComparativeExpressionTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile ComparativeExpression" do
    tree = ComparativeExpression.new("1 == 2", 0, [
      IntegerLiteral.new("1", 0),
      EqualityOperator.new("==", 2),
      IntegerLiteral.new("2", 5)
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      PUSH_INT, 2, 
      EQUAL
    ], bytecode
  end
  
end