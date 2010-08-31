require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class KeyValueListTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile KeyValueList" do
    tree = KeyValueList.new("1 => 2, 2 => 3", 0, [
      KeyValue.new("1 => 2", 0, [
        Expression.new("1", 0, [
          IntegerLiteral.new("1", 0)
        ]),
        Expression.new("2", 5, [
          IntegerLiteral.new("2", 5)
        ])
      ]),
      KeyValue.new("2 => 3", 8, [
        Expression.new("2", 8, [
          IntegerLiteral.new("2", 8)
        ]),
        Expression.new("3", 13, [
          IntegerLiteral.new("3", 13)
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