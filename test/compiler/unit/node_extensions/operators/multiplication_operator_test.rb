require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class MultiplicationOperatorTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile MultiplicationOperator" do
    tree = MultiplicationOperator.new("*", 0)
    bytecode = tree.compile
    assert_equal [MULTIPLY], bytecode
  end
  
end