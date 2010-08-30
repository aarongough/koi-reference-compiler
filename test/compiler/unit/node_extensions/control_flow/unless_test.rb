require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class UnlessTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile Unless" do
    input = "unless( 1 == 1 )\n arg = 1\n end"
    tree = Unless.new(input, 0...32, [
      Expression.new(input, 8...14, [
        ComparativeExpression.new(input, 8...14, [
          IntegerLiteral.new(input, 8...9),
          EqualityOperator.new(input, 10...12),
          IntegerLiteral.new(input, 13...14)
        ])
      ]),
      Block.new(input, 17...26,[
        Statement.new(input, 17...26, [
          Assignment.new(input, 18..24, [
            Identifier.new(input, 18...21),
            AssignmentOperator.new(input, 22...23),
            Expression.new(input, 24...25, [
              IntegerLiteral.new(input, 24...25)
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