require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class HashAccessorListTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile lvalue HashAccessorList to SET_KEY" do
    input = "test[1] = 1"
    tree = HashAssignment.new(input, 0...11, [
      Identifier.new(input, 0...4),
      HashAccessorList.new(input, 4...7, [
        HashAccessor.new(input, 4...7, [
          Expression.new(input, 5...6, [
            IntegerLiteral.new(input, 5...6)
          ])
        ])
      ]),
      AssignmentOperator.new(input, 8...9),
      Expression.new(input, 10...11, [
        IntegerLiteral.new(input, 10...11)
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      PUSH_INT, 1,
      PUSH_INT, 1, 
      SET_KEY,
      POP
    ], bytecode
  end
  
  test "should compile lvalue HashAccessorList to GET_KEY, SET_KEY" do
    input = "test[1][1] = 1"
    tree = HashAssignment.new(input, 0...14, [
      Identifier.new(input, 0...4),
      HashAccessorList.new(input, 4...7, [
        HashAccessor.new(input, 4...7, [
          Expression.new(input, 5...6, [
            IntegerLiteral.new(input, 5...6)
          ])
        ]),
        HashAccessor.new(input, 7...10, [
          Expression.new(input, 8...9, [
            IntegerLiteral.new(input, 8...9)
          ])
        ])
      ]),
      AssignmentOperator.new(input, 11...12),
      Expression.new(input, 13...14, [
        IntegerLiteral.new(input, 13...14)
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      PUSH_INT, 1,
      GET_KEY,
      PUSH_INT, 1,
      PUSH_INT, 1, 
      SET_KEY,
      POP
    ], bytecode
  end
  
  test "should compile rvalue HashAccess to GET_KEY" do
    input = "test[1]"
    tree = HashAccess.new(input, 0...7, [
      Identifier.new(input, 0...4),
      HashAccessorList.new(input, 4...7, [
        HashAccessor.new(input, 4...7, [
          Expression.new(input, 5...6, [
            IntegerLiteral.new(input, 5...6)
          ])
        ])
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      PUSH_INT, 1,
      GET_KEY
    ], bytecode
  end
  
end