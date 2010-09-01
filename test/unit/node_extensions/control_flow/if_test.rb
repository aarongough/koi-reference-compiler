require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class IfTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile If" do
    tree = If.new("if( 1 == 1 )\n arg = 1\n end", 0, [
      Expression.new("1 == 1", 4, [
        ComparativeExpression.new("1 == 1", 4, [
          IntegerLiteral.new("1", 4),
          EqualityOperator.new("==", 6),
          IntegerLiteral.new("1", 9)
        ])
      ]),
      Block.new("arg = 1\n", 13,[
        Statement.new("arg = 1", 13, [
          Assignment.new("arg = 1", 14, [
            Identifier.new("arg", 14),
            AssignmentOperator.new("=", 18),
            Expression.new("1", 20, [
              IntegerLiteral.new("1", 20)
            ])
          ])
        ])
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      PUSH_INT, 1,
      EQUAL,
      JUMP_UNLESS, 6,
      PUSH_INT, 1,
      SET_LOCAL, :arg
    ], bytecode
  end
  
end