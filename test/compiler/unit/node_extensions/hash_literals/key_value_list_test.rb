require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class KeyValueListTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile KeyValueList" do
    input = "1 => 2, 2 => 3"
    tree = KeyValueList.new(input, 0...14, [
      KeyValue.new(input, 0...6, [
        Expression.new(input, 0...1, [
          IntegerLiteral.new(input, 0...1)
        ]),
        Expression.new(input, 5...6, [
          IntegerLiteral.new(input, 5...6)
        ])
      ]),
      KeyValue.new(input, 8...14, [
        Expression.new(input, 8...8, [
          IntegerLiteral.new(input, 8...9)
        ]),
        Expression.new(input, 13...14, [
          IntegerLiteral.new(input, 13...14)
        ])
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      PUSH_INT, 2, 
      SET_KEY,
      PUSH_INT, 2,
      PUSH_INT, 3, 
      SET_KEY
    ], bytecode
  end
  
end