require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class IfTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile If" do
    input = "if( 1 == 1 )\n arg = 1\n end"
    tree = If.new(input, 0...28, [
      Expression.new(input, 4...10, [
        ComparativeExpression.new(input, 4...10, [
          IntegerLiteral.new(input, 4...5),
          EqualityOperator.new(input, 6...8),
          IntegerLiteral.new(input, 9...10)
        ])
      ]),
      Block.new(input, 13...22,[
        Statement.new(input, 13...22, [
          Assignment.new(input, 14..20, [
            Identifier.new(input, 14...17),
            AssignmentOperator.new(input, 18...19),
            Expression.new(input, 20...21, [
              IntegerLiteral.new(input, 20...21)
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