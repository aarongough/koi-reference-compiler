require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class StatementTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile Statement" do
    input = "test = 1"
    elements = [
      Assignment.new(input, 0...8, [
        Identifier.new(input, 0...4),
        AssignmentOperator.new(input, 5...6),
        Expression.new(input, 7...8, [
          IntegerLiteral.new(input, 7...8)
        ])
      ])
    ]
    tree =  Statement.new(input, 0...8, elements)
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1, 
      SET_LOCAL, :test
    ], bytecode
  end
  
end