# Instructions append

The tests for this exercise expect that your clock will be implemented using a `data declaration` in Pyret. If you are unfamiliar with data declarations, [the official documentation][data-declaration] is a good place to start.

## Representing your structure

When debugging, it's often helpful to have a string representation of your data. [Printing][print] or preferably [spying][spy] a value will return a string representation of the expression to create it:

```pyret

data Data:
  | foo-A()
  | foo-B(x)
end

a = foo-A()
b = foo-B(3)
c = 100
spy: a, b, c end

# Spying (at .../example.arr:9:0-9:16)
#   a: fooA()
#   b: fooB(3)
#   c: 100
```

Pyret doesn't easily support overwriting this default string representation. Objects do have a hidden `_output` method which controls how they are displayed on the online.  When implementing this method, be aware that Pyret will expect a `ValueSkeleton` variant to be returned. For these purposes, we can either use `vs-value` or `vs-str`.  `vs-value` will take any value and properly escape characters, adding quotes for strings. `vs-str` only takes a string and will print characters exactly as written, not escaping any characters or wrapping the string in quotes.

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

# Spying (at .../example.arr:15:0-15:16)
#   a: \
#   b: "\\"
#   c: 100
```

[data-declaration]: "https://pyret.org/docs/latest/s_declarations.html#%28part._s~3adata-decl%29"
[print]: "https://pyret.org/docs/latest/_global_.html#%28idx._%28gentag._57%29%29"
[spy]: "https://pyret.org/docs/latest/s_spies.html#%28idx._%28gentag._56%29%29"
