require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class StringLiteralTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile StringLiteral" do
    tree = StringLiteral.new('"test"', 0)
    bytecode = tree.compile
    assert_equal [PUSH_STRING, 'test'], bytecode
  end
  
end