require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class AssignmentTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile Assignment" do
    tree = Assignment.new("test = 1", 0, [
      Identifier.new("test", 0),
      AssignmentOperator.new("=", 5),
      Expression.new("1", 7, [
        IntegerLiteral.new("1", 7)
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1, 
      SET_LOCAL, :test
    ], bytecode
  end
  
end