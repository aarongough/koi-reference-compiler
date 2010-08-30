require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class FalseLiteralTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile FalseLiteral" do
    tree = FalseLiteral.new("false", 0...5)
    bytecode = tree.compile
    assert_equal [PUSH_BOOL, false], bytecode
  end
  
end