require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'test_helper.rb'))

class FunctionCallTest < Test::Unit::TestCase

  include KoiReferenceCompiler
  
  ##################
  # call()
  
  test "should compile FunctionCall for call() built-in" do
    input = "call( test, 1 )"
    elements = [
      Identifier.new(input, 0...4),
      Expression.new(input, 6...10, [
        Identifier.new(input, 6...10)
      ]),
      Expression.new(input, 12...13, [
        IntegerLiteral.new(input, 12...13)
      ])
    ]
    tree = FunctionCall.new(input, 0...15, elements)
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      GET_LOCAL, :test,
      CALL
    ], bytecode
  end
  
  test "should raise CompileError if call() is passed only 1 argument" do
    assert_raises CompileError do
      input = "call( test )"
      elements = [
        Identifier.new(input, 0...4),
        Expression.new(input, 6...16, [
          Identifier.new(input, 6...10)
        ])
      ]
      tree = FunctionCall.new(input, 0...12, elements)
      tree.compile
    end
  end
  
  test "should raise CompileError if call() is not passed any arguments" do
    assert_raises CompileError do
      input = "call()"
      elements = [
        Identifier.new(input, 0...4)
      ]
      tree = FunctionCall.new(input, 0...6, elements)
      tree.compile
    end
  end
  
  ##################
  # print()
  
  test "should compile FunctionCall for print() built-in" do
    input = "print( test )"
    elements = [
      Identifier.new(input, 0...5),
      Expression.new(input, 7...11, [
        Identifier.new(input, 7...11)
      ])
    ]
    tree = FunctionCall.new(input, 0...13, elements)
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      PRINT
    ], bytecode
  end
  
  test "should raise CompileError if print() is not passed any arguments" do
    assert_raises CompileError do
      input = "print()"
      elements = [
        Identifier.new(input, 0...5)
      ]
      tree = FunctionCall.new(input, 0...7, elements)
      tree.compile
    end
  end
  
  test "should raise CompileError if print() is passed 2 arguments" do
    assert_raises CompileError do
      input = "print( test, 1 )"
      elements = [
        Identifier.new(input, 0...5),
        Expression.new(input, 7...11, [
          Identifier.new(input, 7...11)
        ]),
        Expression.new(input, 13...14, [
          IntegerLiteral.new(input, 13...14)
        ])
      ]
      tree = FunctionCall.new(input, 0...16, elements)
      tree.compile
    end
  end
  
  ##################
  # gets()  
  
  test "should compile FunctionCall for gets() built-in" do
    input = "gets( )"
    elements = [
      Identifier.new(input, 0...4)
    ]
    tree = FunctionCall.new(input, 0...7, elements)
    bytecode = tree.compile
    assert_equal [
      GETS
    ], bytecode
  end
  
  test "should raise CompileError if gets() is passed 1 argument" do
    assert_raises CompileError do
      input = "gets( test )"
      elements = [
        Identifier.new(input, 0...4),
        Expression.new(input, 6...16, [
          Identifier.new(input, 6...10)
        ])
      ]
      tree = FunctionCall.new(input, 0...12, elements)
      tree.compile
    end
  end
  
  test "should raise CompileError if gets() is passed 2 arguments" do
    assert_raises CompileError do
      input = "gets( test, 1 )"
      elements = [
        Identifier.new(input, 0...5),
        Expression.new(input, 6...10, [
          Identifier.new(input, 6...10)
        ]),
        Expression.new(input, 12...13, [
          IntegerLiteral.new(input, 12...13)
        ])
      ]
      tree = FunctionCall.new(input, 0...15, elements)
      tree.compile
    end
  end
  
  ##################
  # tailcall()
  
  test "should compile FunctionCall for tailcall() built-in" do
    input = "tailcall( test, 1 )"
    elements = [
      Identifier.new(input, 0...8),
      Expression.new(input, 10...14, [
        Identifier.new(input, 10...14)
      ]),
      Expression.new(input, 16...17, [
        IntegerLiteral.new(input, 16...17)
      ])
    ]
    tree = FunctionCall.new(input, 0...19, elements)
    bytecode = tree.compile
    assert_equal [
      PUSH_INT, 1,
      GET_LOCAL, :test,
      TAILCALL
    ], bytecode
  end
  
  test "should raise CompileError if tailcall() is not passed any arguments" do
    assert_raises CompileError do
      input = "tailcall()"
      elements = [
        Identifier.new(input, 0...8)
      ]
      tree = FunctionCall.new(input, 0...10, elements)
      tree.compile
    end
  end
  
  ##################
  # return()
  
  test "should compile FunctionCall for return() built-in" do
    input = "return( test )"
    elements = [
      Identifier.new(input, 0...6),
      Expression.new(input, 8...12, [
        Identifier.new(input, 8...12)
      ])
    ]
    tree = FunctionCall.new(input, 0...14, elements)
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      RETURN
    ], bytecode
  end
  
  test "should compile FunctionCall for return() built-in with no arguments" do
    input = "return()"
    elements = [
      Identifier.new(input, 0...6)
    ]
    tree = FunctionCall.new(input, 0...8, elements)
    bytecode = tree.compile
    assert_equal [
      RETURN
    ], bytecode
  end
  
  test "should raise CompileError if return() is passed 2 arguments" do
    assert_raises CompileError do
      input = "return( test, 1 )"
      elements = [
        Identifier.new(input, 0...6),
        Expression.new(input, 8...12, [
          Identifier.new(input, 8...12)
        ]),
        Expression.new(input, 14...15, [
          IntegerLiteral.new(input, 14...15)
        ])
      ]
      tree = FunctionCall.new(input, 0...17, elements)
      tree.compile
    end
  end
  
  ##################
  # to_string()
  
  test "should compile FunctionCall for to_string() built-in" do
    input = "to_string( test )"
    elements = [
      Identifier.new(input, 0...9),
      Expression.new(input, 11...15, [
        Identifier.new(input, 11...15)
      ])
    ]
    tree = FunctionCall.new(input, 0...17, elements)
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      TO_STRING
    ], bytecode
  end
  
  test "should raise CompileError if to_string() is not passed any arguments" do
    assert_raises CompileError do
      input = "to_string()"
      elements = [
        Identifier.new(input, 0...9)
      ]
      tree = FunctionCall.new(input, 0...11, elements)
      tree.compile
    end
  end
  
  test "should raise CompileError if to_string() is passed 2 arguments" do
    assert_raises CompileError do
      input = "to_string( test, 1 )"
      elements = [
        Identifier.new(input, 0...9),
        Expression.new(input, 11...15, [
          Identifier.new(input, 11...15)
        ]),
        Expression.new(input, 17...18, [
          IntegerLiteral.new(input, 17...18)
        ])
      ]
      tree = FunctionCall.new(input, 0...20, elements)
      tree.compile
    end
  end

  ##################
  # type_of()

  test "should compile FunctionCall for type_of() built-in" do
    input = "type_of( test )"
    elements = [
      Identifier.new(input, 0...7),
      Expression.new(input, 9...13, [
        Identifier.new(input, 9...13)
      ])
    ]
    tree = FunctionCall.new(input, 0...15, elements)
    bytecode = tree.compile
    assert_equal [
      GET_LOCAL, :test,
      TYPEOF
    ], bytecode
  end
  
  test "should raise CompileError if type_of() is not passed any arguments" do
    assert_raises CompileError do
      input = "type_of()"
      elements = [
        Identifier.new(input, 0...7)
      ]
      tree = FunctionCall.new(input, 0...9, elements)
      tree.compile
    end
  end
  
  test "should raise CompileError if type_of() is passed 2 arguments" do
    assert_raises CompileError do
      input = "type_of( test, 1 )"
      elements = [
        Identifier.new(input, 0...7),
        Expression.new(input, 9...13, [
          Identifier.new(input, 9...13)
        ]),
        Expression.new(input, 15...16, [
          IntegerLiteral.new(input, 15...16)
        ])
      ]
      tree = FunctionCall.new(input, 0...18, elements)
      tree.compile
    end
  end
  
  ##################
  # unknown!
  
  test "should raise CompileError if function name is not defined" do
    assert_raises CompileError do
      input = "fooey()"
      elements = [
        Identifier.new(input, 0...5)
      ]
      tree = FunctionCall.new(input, 0...7, elements)
      tree.compile
    end
  end
  
end