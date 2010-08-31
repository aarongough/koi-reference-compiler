require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class AstHashLoaderTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  test "should turn AST hash into object" do
    ast_hash = {
      :parent => nil,
      :elements => nil,
      :offset => 0,
      :name => "Identifier",
      :text_value => "test"
    }
    tree = Compiler.load_ast_hash(ast_hash)
    assert_kind_of Identifier, tree
    assert_equal nil, tree.parent
    assert_equal nil, tree.elements
    assert_equal 0, tree.offset
    assert_equal "test", tree.text_value
  end
  
  test "should turn nested AST hash into nested objects" do
    built_hash = {
      :parent => nil,
      :elements => nil,
      :offset => 0,
      :name => "Assignment",
      :text_value => "test = 1"
    }
    built_hash[:elements] = [
      {
      :parent => built_hash,
      :elements => nil,
      :offset => 0,
      :name => "Identifier",
      :text_value => "test"
      }
    ]
    tree = Compiler.load_ast_hash(built_hash)
    assert_kind_of Assignment, tree
    assert_kind_of Identifier, tree.elements.first
    assert_equal tree, tree.elements.first.parent
  end
  
end