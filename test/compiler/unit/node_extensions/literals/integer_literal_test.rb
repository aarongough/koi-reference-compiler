require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class IntegerLiteralTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile IntegerLiteral" do
    tree = IntegerLiteral.new("99", 0...2)
    bytecode = tree.compile
    assert_equal [PUSH_INT, 99], bytecode
  end
  
end