require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class GreaterThanOperatorTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile GreaterThanOperator" do
    tree = GreaterThanOperator.new(">", 0...1)
    bytecode = tree.compile
    assert_equal [GREATER_THAN], bytecode
  end
  
end