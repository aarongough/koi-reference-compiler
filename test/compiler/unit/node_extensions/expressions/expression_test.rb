require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class ExpressionTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile Expression" do
    elements = [
      IntegerLiteral.new("1", 0...1)
    ]
    tree = Expression.new("2", 0...1, elements)
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1
    ], bytecode
  end
  
end