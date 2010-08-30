require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class FunctionDefinitionTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile FunctionDefinition" do
    input = "function( arg )\n arg = 1\n end"
    tree = FunctionDefinition.new(input, 0...31, [
      Identifier.new(input, 10...13),
      Block.new(input, 17...25,[
        Statement.new(input, 17...25, [
          Assignment.new(input, 17..23, [
            Identifier.new(input, 17...20),
            AssignmentOperator.new(input, 21...22),
            Expression.new(input, 23...24, [
              IntegerLiteral.new(input, 23...24)
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