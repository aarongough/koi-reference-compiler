require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class InqualityOperatorTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile InqualityOperator" do
    tree = InequalityOperator.new("!=", 0...2)
    bytecode = tree.compile
    assert_equal [EQUAL, INVERT], bytecode
  end
  
end