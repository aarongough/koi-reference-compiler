require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class IdentifierTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile identifier with Assignment as parent to SET_LOCAL" do
    tree = Assignment.new("test = 2", 0, [
      Identifier.new('test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [SET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with FunctionDefinition as parent to SET_LOCAL" do
    tree = FunctionDefinition.new("test = 2", 0, [
      Identifier.new('test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [SET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with Expression as parent to GET_LOCAL" do
    tree = Expression.new("test = 2", 0, [
      Identifier.new('test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [GET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with MultitiveExpression as parent to GET_LOCAL" do
    tree = MultitiveExpression.new("test = 2", 0, [
      Identifier.new('test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [GET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with AdditiveExpression as parent to GET_LOCAL" do
    tree = AdditiveExpression.new("test = 2", 0, [
      Identifier.new('test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [GET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with ComparativeExpression as parent to GET_LOCAL" do
    tree = ComparativeExpression.new("test = 2", 0, [
      Identifier.new('test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [GET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with Assignment as parent to SET_GLOBAL" do
    tree = Assignment.new("$test = 2", 0, [
      Identifier.new('$test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [SET_GLOBAL, :$test], bytecode
  end
  
  test "should compile identifier with FunctionDefinition as parent to SET_GLOBAL" do
    tree = FunctionDefinition.new("$test = 2", 0, [
      Identifier.new('$test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [SET_GLOBAL, :$test], bytecode
  end
  
  test "should compile identifier with Expression as parent to GET_GLOBAL" do
    tree = Expression.new("$test = 2", 0, [
      Identifier.new('$test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [GET_GLOBAL, :$test], bytecode
  end
  
  test "should compile identifier with MultitiveExpression as parent to GET_GLOBAL" do
    tree = MultitiveExpression.new("$test = 2", 0, [
      Identifier.new('$test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [GET_GLOBAL, :$test], bytecode
  end
  
  test "should compile identifier with AdditiveExpression as parent to GET_GLOBAL" do
    tree = AdditiveExpression.new("$test = 2", 0, [
      Identifier.new('$test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [GET_GLOBAL, :$test], bytecode
  end
  
  test "should compile identifier with ComarativeExpression as parent to GET_GLOBAL" do
    tree = ComparativeExpression.new("$test = 2", 0, [
      Identifier.new('$test', 0)
    ])
    bytecode = tree.elements.first.compile
    assert_equal [GET_GLOBAL, :$test], bytecode
  end
  
end