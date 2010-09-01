require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class FunctionCallTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  ##################
  # call()
  
  test "should compile FunctionCall for call() built-in" do
    tree = FunctionCall.new("call( test, 1 )", 0, [
      Identifier.new("call", 0),
      Expression.new("test", 6, [
        Identifier.new("test", 6)
      ]),
      Expression.new("1", 12, [
        IntegerLiteral.new("1", 12)
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      GET_LOCAL, :test,
      CALL
    ], bytecode
  end
  
  test "should raise CompileError if call() is passed only 1 argument" do
    assert_raises CompileError do
      tree = FunctionCall.new("call( test )", 0, [
        Identifier.new("call", 0),
        Expression.new("test", 6, [
          Identifier.new("test", 6)
        ])
      ])
      tree.compile
    end
  end
  
  test "should raise CompileError if call() is not passed any arguments" do
    assert_raises CompileError do
      tree = FunctionCall.new("call()", 0, [
        Identifier.new("call", 0)
      ])
      tree.compile
    end
  end
  
  ##################
  # print()
  
  test "should compile FunctionCall for print() built-in" do
    tree = FunctionCall.new("print( test )", 0, [
      Identifier.new("print", 0),
      Expression.new("test", 7, [
        Identifier.new("test", 7)
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      PRINT
    ], bytecode
  end
  
  test "should raise CompileError if print() is not passed any arguments" do
    assert_raises CompileError do
      tree = FunctionCall.new("print()", 0, [
        Identifier.new("print", 0)
      ])
      tree.compile
    end
  end
  
  test "should raise CompileError if print() is passed 2 arguments" do
    assert_raises CompileError do
      tree = FunctionCall.new("print( test, 1 )", 0, [
        Identifier.new("print", 0),
        Expression.new("test", 7, [
          Identifier.new("test", 7)
        ]),
        Expression.new("1", 13, [
          IntegerLiteral.new("1", 13)
        ])
      ])
      tree.compile
    end
  end
  
  ##################
  # gets()  
  
  test "should compile FunctionCall for gets() built-in" do
    tree = FunctionCall.new("gets()", 0, [
      Identifier.new("gets", 0)
    ])
    bytecode = tree.compile
    assert_equal [
      GETS
    ], bytecode
  end
  
  test "should raise CompileError if gets() is passed 1 argument" do
    assert_raises CompileError do
      tree = FunctionCall.new("gets( test )", 0, [
        Identifier.new("gets", 0),
        Expression.new("test", 6, [
          Identifier.new("test", 6)
        ])
      ])
      tree.compile
    end
  end
  
  test "should raise CompileError if gets() is passed 2 arguments" do
    assert_raises CompileError do
      tree = FunctionCall.new("gets( test, 1 )", 0, [
        Identifier.new("gets", 0),
        Expression.new("test", 7, [
          Identifier.new("test", 7)
        ]),
        Expression.new("1", 13, [
          IntegerLiteral.new("1", 13)
        ])
      ])
      tree.compile
    end
  end
  
  ##################
  # tailcall()
  
  test "should compile FunctionCall for tailcall() built-in" do
    tree = FunctionCall.new("tailcall( test, 1 )", 0, [
      Identifier.new("tailcall", 0),
      Expression.new("test", 10, [
        Identifier.new("test", 10)
      ]),
      Expression.new("1", 16, [
        IntegerLiteral.new("1", 16)
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      GET_LOCAL, :test,
      TAILCALL
    ], bytecode
  end
  
  test "should raise CompileError if tailcall() is not passed any arguments" do
    assert_raises CompileError do
      tree = FunctionCall.new("tailcall()", 0, [
        Identifier.new("tailcall", 0)
      ])
      tree.compile
    end
  end
  
  ##################
  # return()
  
  test "should compile FunctionCall for return() built-in" do
    tree = FunctionCall.new("return( test )", 0, [
      Identifier.new("return", 0),
      Expression.new("test", 8, [
        Identifier.new("test", 8)
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      RETURN
    ], bytecode
  end
  
  test "should compile FunctionCall for return() built-in with no arguments" do
    tree = FunctionCall.new("return()", 0, [
      Identifier.new("return", 0)
    ])
    bytecode = tree.compile
    assert_equal [
      RETURN
    ], bytecode
  end
  
  test "should raise CompileError if return() is passed 2 arguments" do
    assert_raises CompileError do
      tree = FunctionCall.new("return( test, 1 )", 0, [
        Identifier.new("return", 0),
        Expression.new("test", 7, [
          Identifier.new("test", 7)
        ]),
        Expression.new("1", 13, [
          IntegerLiteral.new("1", 13)
        ])
      ])
      tree.compile
    end
  end
  
  ##################
  # to_string()
  
  test "should compile FunctionCall for to_string() built-in" do
    tree = FunctionCall.new("to_string( test )", 0, [
      Identifier.new("to_string", 0),
      Expression.new("test", 11, [
        Identifier.new("test", 11)
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      TO_STRING
    ], bytecode
  end
  
  test "should raise CompileError if to_string() is not passed any arguments" do
    assert_raises CompileError do
      tree = FunctionCall.new("to_string()", 0, [
        Identifier.new("to_string", 0)
      ])
      tree.compile
    end
  end
  
  test "should raise CompileError if to_string() is passed 2 arguments" do
    assert_raises CompileError do
      tree = FunctionCall.new("to_string( test, 1 )", 0, [
        Identifier.new("to_string", 0),
        Expression.new("test", 7, [
          Identifier.new("test", 7)
        ]),
        Expression.new("1", 13, [
          IntegerLiteral.new("1", 13)
        ])
      ])
      tree.compile
    end
  end

  ##################
  # type_of()

  test "should compile FunctionCall for type_of() built-in" do
    tree = FunctionCall.new("type_of( test )", 0, [
      Identifier.new("type_of", 0),
      Expression.new("test", 9, [
        Identifier.new("test", 9)
      ])
    ])
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      TYPEOF
    ], bytecode
  end
  
  test "should raise CompileError if type_of() is not passed any arguments" do
    assert_raises CompileError do
      tree = FunctionCall.new("type_of()", 0, [
        Identifier.new("type_of", 0)
      ])
      tree.compile
    end
  end
  
  test "should raise CompileError if type_of() is passed 2 arguments" do
    assert_raises CompileError do
      tree = FunctionCall.new("type_of( test, 1 )", 0, [
        Identifier.new("type_of", 0),
        Expression.new("test", 7, [
          Identifier.new("test", 7)
        ]),
        Expression.new("1", 13, [
          IntegerLiteral.new("1", 13)
        ])
      ])
      tree.compile
    end
  end
  
  ##################
  # unknown!
  
  test "should raise CompileError if function name is not defined" do
    assert_raises CompileError do
      tree = FunctionCall.new("fooey()", 0, [
        Identifier.new("fooey", 0)
      ])
      tree.compile
    end
  end
  
end