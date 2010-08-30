require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class IdentifierTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile identifier with Assignment as parent to SET_LOCAL" do
    parent = Assignment.new("test = 2", 0...8)
    tree = Identifier.new('test = 2', 0...4)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [SET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with FunctionDefinition as parent to SET_LOCAL" do
    parent = FunctionDefinition.new("test = 2", 0...8)
    tree = Identifier.new('test = 2', 0...4)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [SET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with Expression as parent to GET_LOCAL" do
    parent = Expression.new("test = test", 7...11)
    tree = Identifier.new("test = test", 7...11)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [GET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with MultitiveExpression as parent to GET_LOCAL" do
    parent = MultitiveExpression.new("test = test", 7...11)
    tree = Identifier.new("test = test", 7...11)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [GET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with AdditiveExpression as parent to GET_LOCAL" do
    parent = AdditiveExpression.new("test = test", 7...11)
    tree = Identifier.new("test = test", 7...11)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [GET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with ComparativeExpression as parent to GET_LOCAL" do
    parent = ComparativeExpression.new("test = test", 7...11)
    tree = Identifier.new("test = test", 7...11)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [GET_LOCAL, :test], bytecode
  end
  
  test "should compile identifier with Assignment as parent to SET_GLOBAL" do
    parent = Assignment.new("$test = 2", 0...9)
    tree = Identifier.new('$test = 2', 0...5)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [SET_GLOBAL, :$test], bytecode
  end
  
  test "should compile identifier with FunctionDefinition as parent to SET_GLOBAL" do
    parent = FunctionDefinition.new("$test = 2", 0...9)
    tree = Identifier.new('$test = 2', 0...5)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [SET_GLOBAL, :$test], bytecode
  end
  
  test "should compile identifier with Expression as parent to GET_GLOBAL" do
    parent = Expression.new("test = $test", 7...12)
    tree = Identifier.new("test = $test", 7...12)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [GET_GLOBAL, :$test], bytecode
  end
  
  test "should compile identifier with MultitiveExpression as parent to GET_GLOBAL" do
    parent = MultitiveExpression.new("test = $test", 7...12)
    tree = Identifier.new("test = $test", 7...12)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [GET_GLOBAL, :$test], bytecode
  end
  
  test "should compile identifier with AdditiveExpression as parent to GET_GLOBAL" do
    parent = AdditiveExpression.new("test = $test", 7...12)
    tree = Identifier.new("test = $test", 7...12)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [GET_GLOBAL, :$test], bytecode
  end
  
  test "should compile identifier with ComarativeExpression as parent to GET_GLOBAL" do
    parent = ComparativeExpression.new("test = $test", 7...12)
    tree = Identifier.new("test = $test", 7...12)
    tree.parent = parent
    bytecode = tree.compile
    assert_equal [GET_GLOBAL, :$test], bytecode
  end
  
end