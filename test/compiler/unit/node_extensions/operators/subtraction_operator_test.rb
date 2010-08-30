require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class SubtractionOperatorTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile SubtractionOperator" do
    tree = SubtractionOperator.new("-", 0...1)
    bytecode = tree.compile
    assert_equal [SUBTRACT], bytecode
  end
  
end