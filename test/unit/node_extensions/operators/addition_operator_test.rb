require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class AdditionOperatorTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile AdditionOperator" do
    tree = AdditionOperator.new("+", 0)
    bytecode = tree.compile
    assert_equal [ADD], bytecode
  end
  
end