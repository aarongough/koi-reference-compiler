require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class NilLiteralTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile NilLiteral" do
    tree = NilLiteral.new("nil", 0)
    bytecode = tree.compile
    assert_equal [PUSH_NIL], bytecode
  end
  
end