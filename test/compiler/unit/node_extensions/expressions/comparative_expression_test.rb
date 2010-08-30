require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class ComparativeExpressionTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile ComparativeExpression" do
    elements = [
      IntegerLiteral.new("test = 1 == 2", 7...8),
      EqualityOperator.new("test = 1 == 2", 9...11),
      IntegerLiteral.new("test = 1 == 2", 12..13)
    ]
    tree = ComparativeExpression.new("test = 1 == 2", 7...13, elements)
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      PUSH_INT, 2, 
      EQUAL
    ], bytecode
  end
  
end