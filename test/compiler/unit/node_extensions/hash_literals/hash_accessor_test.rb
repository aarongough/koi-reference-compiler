require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class HashAccessorTest < Test::Unit::TestCase

  include MinKoi
  include KoiVM
  
  test "should compile HashAccessor to GET_KEY" do
    input = "[1]"
    tree =  HashAccessor.new(input, 0...3, [
      Expression.new(input, 1...2, [
        IntegerLiteral.new(input, 1...2)
      ])
    ])
    bytecode = tree.compile_get
    assert_equal [
      PUSH_INT, 1,
      GET_KEY
    ], bytecode
  end
  
  test "should compile HashAccessor to SET_KEY" do
    input = "[1]"
    tree =  HashAccessor.new(input, 0...3, [
      Expression.new(input, 1...2, [
        IntegerLiteral.new(input, 1...2)
      ])
    ])
    bytecode = tree.compile_set
    assert_equal [
      PUSH_INT, 1,
      SET_KEY
    ], bytecode
  end
  
end