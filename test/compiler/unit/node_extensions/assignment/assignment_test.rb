require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class AssignmentTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile Assignment" do
    input = "test = 1"
    elements = [
      Identifier.new(input, 0...4),
      AssignmentOperator.new(input, 5...6),
      Expression.new(input, 7...8, [
        IntegerLiteral.new(input, 7...8)
      ])
    ]
    tree = Assignment.new(input, 0...8, elements)
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1, 
      SET_LOCAL, :test
    ], bytecode
  end
  
end