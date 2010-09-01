require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class ExpressionTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile Expression" do
    tree = Expression.new("1", 0, [
      IntegerLiteral.new("1", 0)
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1
    ], bytecode
  end
  
end