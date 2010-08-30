require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class LessThanOperatorTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile LessThanOperator" do
    tree = LessThanOperator.new("<", 0...1)
    bytecode = tree.compile
    assert_equal [LESS_THAN], bytecode
  end
  
end