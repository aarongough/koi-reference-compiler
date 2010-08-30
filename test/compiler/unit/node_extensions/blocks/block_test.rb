require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class BlockTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile Block" do
    input = "test = 1\ntest2 = 2"
    elements = [
      Statement.new(input, 0...8, [
        Assignment.new(input, 0...8, [
          Identifier.new(input, 0...4),
          AssignmentOperator.new(input, 5...6),
          Expression.new(input, 7...8, [
            IntegerLiteral.new(input, 7...8)
          ])
        ])
      ]),
      Statement.new(input, 10...19, [
        Assignment.new(input, 10...19, [
          Identifier.new(input, 9...14),
          AssignmentOperator.new(input, 15...16),
          Expression.new(input, 17...18, [
            IntegerLiteral.new(input, 17...18)
          ])
        ])
      ])
    ]
    tree =  Block.new(input, 0...19, elements)
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1, 
      SET_LOCAL, :test,
      PUSH_INT, 2, 
      SET_LOCAL, :test2
    ], bytecode
  end
  
end