require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class TrueLiteralTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile TrueLiteral" do
    tree = TrueLiteral.new("true", 0...4)
    bytecode = tree.compile
    assert_equal [PUSH_BOOL, true], bytecode
  end
  
end