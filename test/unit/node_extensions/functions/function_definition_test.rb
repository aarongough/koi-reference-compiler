require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class FunctionDefinitionTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile FunctionDefinition" do
    tree = FunctionDefinition.new("function( arg )\n arg = 1\n end", 0, [
      Identifier.new("arg", 10),
      Block.new("arg = 1\n", 17,[
        Statement.new("arg = 1", 17, [
          Assignment.new("arg = 1", 17, [
            Identifier.new("arg", 17),
            AssignmentOperator.new("=", 21),
            Expression.new("1", 23, [
              IntegerLiteral.new("1", 23)
            ])
          ])
        ])
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_FUNCTION, 0,
      
      SET_LOCAL, :arg,
      
      PUSH_INT, 1,
      SET_LOCAL, :arg,
      
      RETURN,
      END_FUNCTION, 0,
      END_FUNCTION, 0
    ], bytecode
  end
  
end