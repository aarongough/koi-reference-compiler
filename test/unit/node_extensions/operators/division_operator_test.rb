require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class DivisionOperatorTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile DivisionnOperator" do
    tree = DivisionOperator.new("/", 0)
    bytecode = tree.compile
    assert_equal [DIVIDE], bytecode
  end
  
end