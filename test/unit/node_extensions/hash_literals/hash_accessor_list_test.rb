require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class HashAccessorListTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile lvalue HashAccessorList to SET_KEY" do
    tree = HashAssignment.new("test[1] = 1", 0, [
      Identifier.new("test", 0),
      HashAccessorList.new("[1]", 4, [
        HashAccessor.new("[1]", 4, [
          Expression.new("1", 5, [
            IntegerLiteral.new("1", 5)
          ])
        ])
      ]),
      AssignmentOperator.new("=", 8),
      Expression.new("1", 10, [
        IntegerLiteral.new("1", 10)
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
    tree = HashAssignment.new("test[1][1] = 1", 0, [
      Identifier.new("test", 0),
      HashAccessorList.new("[1][1]", 4, [
        HashAccessor.new("[1]", 4, [
          Expression.new("1", 5, [
            IntegerLiteral.new("1", 5)
          ])
        ]),
        HashAccessor.new("[1]", 7, [
          Expression.new("1", 8, [
            IntegerLiteral.new("1", 8)
          ])
        ])
      ]),
      AssignmentOperator.new("=", 11),
      Expression.new("1", 13, [
        IntegerLiteral.new("1", 13)
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
    tree = HashAccess.new("test[1]", 0, [
      Identifier.new("test", 0),
      HashAccessorList.new("[1]", 4, [
        HashAccessor.new("[1]", 4, [
          Expression.new("1", 5, [
            IntegerLiteral.new("1", 5)
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