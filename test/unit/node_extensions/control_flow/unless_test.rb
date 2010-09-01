require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class UnlessTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile Unless" do
    input = "unless( 1 == 1 )\n arg = 1\n end"
    tree = Unless.new("unless( 1 == 1 )\n arg = 1\n end", 0, [
      Expression.new("1 == 1", 8, [
        ComparativeExpression.new("1 == 1", 8, [
          IntegerLiteral.new("1", 8),
          EqualityOperator.new("==", 10),
          IntegerLiteral.new("1", 13)
        ])
      ]),
      Block.new("arg = 1\n", 17,[
        Statement.new("arg = 1", 17, [
          Assignment.new("arg = 1", 18, [
            Identifier.new("arg", 18),
            AssignmentOperator.new("=", 22),
            Expression.new("1", 24, [
              IntegerLiteral.new("1", 24)
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
      JUMP_IF, 6,
      PUSH_INT, 1,
      SET_LOCAL, :arg
    ], bytecode
  end
  
end