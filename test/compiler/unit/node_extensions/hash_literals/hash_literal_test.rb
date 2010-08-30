require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class HashLiteralTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile HashLiteral" do
    input = "{1 => 2}"
    tree = HashLiteral.new(input, 0...8, [
      KeyValueList.new(input, 1...7, [
        KeyValue.new(input, 1...7, [
          Expression.new(input, 1...2, [
            IntegerLiteral.new(input, 1...2)
          ]),
          Expression.new(input, 6...7, [
            IntegerLiteral.new(input, 6...67)
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