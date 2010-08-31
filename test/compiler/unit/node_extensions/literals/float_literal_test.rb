require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class IntegerLiteralTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile FloatLiteral" do
    tree = FloatLiteral.new("99.00019", 0)
    bytecode = tree.compile
    assert_equal [PUSH_FLOAT, 99.00019], bytecode
  end
  
end