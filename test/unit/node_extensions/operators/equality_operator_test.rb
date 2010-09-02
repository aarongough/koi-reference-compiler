require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class EqualityOperatorTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile EqualityOperator" do
    tree = EqualityOperator.new("==", 0)
    bytecode = tree.compile
    assert_equal [EQUAL], bytecode
  end
  
end