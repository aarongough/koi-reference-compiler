require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class HashAccessorTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should compile HashAccessor to GET_KEY" do
    tree =  HashAccessor.new("[1]", 0, [
      Expression.new("1", 1, [
        IntegerLiteral.new("1", 1)
      ])
    ])
    bytecode = tree.compile_get
    assert_equal [
      PUSH_INT, 1,
      GET_KEY
    ], bytecode
  end
  
  test "should compile HashAccessor to SET_KEY" do
    tree =  HashAccessor.new("[1]", 0, [
      Expression.new("1", 1, [
        IntegerLiteral.new("1", 1)
      ])
    ])
    bytecode = tree.compile_set
    assert_equal [
      PUSH_INT, 1,
      SET_KEY
    ], bytecode
  end
  
end