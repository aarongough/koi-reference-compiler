require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class HashLiteralTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile HashLiteral" do
    tree = HashLiteral.new("{1 => 2}", 0, [
      KeyValueList.new("1 => 2", 1, [
        KeyValue.new("1 => 2", 1, [
          Expression.new("1", 1, [
            IntegerLiteral.new("1", 1)
          ]),
          Expression.new("2", 6, [
            IntegerLiteral.new("2", 6)
          ])
        ])
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_HASH,
      PUSH_INT, 1,
      PUSH_INT, 2, 
      SET_KEY
    ], bytecode
  end
  
end