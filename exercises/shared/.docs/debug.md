# Debug

To help with debugging, you can use the fact that any console output will be shown in the test results window. You can write to the console using a [print] expression:

```pyret
print("Debug message")
# "Debug message"
```

However, this can be unwieldly because Pyret by default only allows a single expression in a block. You'd need to use the `block` keyword to allow multiple expressions.

```pyret
fun do-something():
  print("Debug message")
  # do something else
end

do_something() # won't compile
```

```pyret
fun do-something():
  block:
    print("Debug message")
    # do something else
  end
end

do_something() # will compile
# "Debug message"
```

## Spies

Considering these limitations, a [spy][spy] is often recommended:

```pyret
fun do-something():
    foo = "something"
    spy: foo end
    # do something else
end

do_something()
# Spying (at .../example.arr:3:4-3:14)
#   foo: "something"
```

A spy takes a binding and reports the file the spy is in, the line and column numbers for the spy, and then the name and value for that binding. Optionally, it takes a label. You can also spy on multiple bindings at once or use multiple spies in a block.

```pyret
fun do-something():
    foo = "something"
    bar = 3
    spy "multiple bindings": foo, bar end
    # do something else
end

do_something()
# Spying "multiple bindings" (at .../example.arr:4:4-4:41)
#   foo: "something"
#   bar: 3
```

```pyret
fun do-something():
    foo = "something"
    bar = 3
    spy "foo": foo end
    spy "bar": bar end
    # do something else
end

do_something()
# Spying "foo" (at .../example.arr:4:4-4:22)
#   foo: "something"
# Spying "bar" (at .../example.arr:5:4-5:22)
#   bar: 3
```

## Changing a custom representation

Pyret by default uses a representation of a value that can be used to create the value you're printing. This means you could paste the output back into Pyret code and have it execute.

However, this is a problem when you're working with [data declarations], because what gets printed then is the data variant used to construct the value. In such a situation, you'd likely need to override this string representation to provide more meaningful information.

This can be done by implementing a `_output` method which tells Pyret how to display the value. Pyret will expect an internal `ValueSkeleton` variant to be returned by this method so you can use `vs-value` or `vs-str`. The `vs-value` variant accepts any value, properly escaping characters and adding quote marks for strings. `vs-str` on the other hand only accepts strings and will print characters exactly as written.

```pyret
data Data:
  | foo(str) with:
    method change-to-bar(self): bar(self.str) end
  | bar(str)
end

example-foo = foo("a")
example-bar = bar("a")
example-foo-to-bar = example-foo.change-to-bar()
spy "examples": example-foo, example-bar, example-foo-to-bar end

# Spying "examples" (at .../example.arr:10:0-10:64)
#   example-foo: foo("a")
#   example-bar: bar("a")
#   example-foo-to-bar: bar("a")
```

```pyret
import valueskeleton as VS

data Data:
  | foo-A() with:
    method _output(self): VS.vs-str("\\") end
  | foo-B() with:
    method _output(self): VS.vs-value("\\") end
  | foo-C() with:
    method _output(self): VS.vs-value(100) end
end

a = foo-A()
b = foo-B()
c = foo-C()
spy: a, b, c end

# Spying (at .../example.arr:17:0-17:16)
#   a: \
#   b: "\\"
#   c: 100
```

[print]: https://pyret.org/docs/latest/_global_.html#%28idx._%28gentag._57%29%29
[spy]: https://pyret.org/docs/latest/s_spies.html
[data declarations]: https://pyret.org/docs/latest/s_declarations.html#%28part._s~3adata-decl%29
