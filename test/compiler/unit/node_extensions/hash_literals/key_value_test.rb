require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class KeyValueTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile KeyValue" do
    input = "1 => 2"
    tree = KeyValue.new(input, 0...6, [
      Expression.new(input, 0...1, [
        IntegerLiteral.new(input, 0...1)
      ]),
      Expression.new(input, 5...6, [
        IntegerLiteral.new(input, 5...6)
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