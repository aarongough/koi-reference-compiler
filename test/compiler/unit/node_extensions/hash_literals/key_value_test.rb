require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class KeyValueTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile KeyValue" do
    tree = KeyValue.new("1 => 2", 0...6, [
      Expression.new("1", 0...1, [
        IntegerLiteral.new("1", 0...1)
      ]),
      Expression.new("2", 5...6, [
        IntegerLiteral.new("2", 5...6)
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      PUSH_INT, 2, 
      SET_KEY
    ], bytecode
  end
  
end