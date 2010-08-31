require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class BlockTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile Block" do
    tree = Block.new("test = 1\ntest2 = 2", 0, [
      Statement.new("test = 1\n", 0, [
        Assignment.new("test = 1", 0, [
          Identifier.new("test", 0),
          AssignmentOperator.new("=", 5),
          Expression.new("1", 7, [
            IntegerLiteral.new("1", 7)
          ])
        ])
      ]),
      Statement.new("test2 = 2", 10, [
        Assignment.new("test2 = 2", 10, [
          Identifier.new("test2", 9),
          AssignmentOperator.new("=", 15),
          Expression.new("2", 17, [
            IntegerLiteral.new("2", 17)
          ])
        ])
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1, 
      SET_LOCAL, :test,
      PUSH_INT, 2, 
      SET_LOCAL, :test2
    ], bytecode
  end
  
end