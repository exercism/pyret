# Instructions append

The tests for this exercise expect that your clock will be implemented using a `data declaration` in Pyret. If you are unfamiliar with data declarations, [the official documentation][data-declaration] is a good place to start. As part of the exercise, you'll be comparing instances of a data declaration where different values might be equal where they wouldn't normally so we'd need to provide a custom equality check. If you're unfamiliar with how Pyret handles equality, review the official docs on [equality]

## Debugging

When debugging, it's often helpful to have a snapshot representation of your data. In Pyret, this can be done with a [spy], which prints an expression that can be used to recreate that variable. Another option is [print] expressions, but since they also return the value they're printing, prints can be problematic in Pyret, which doesn't allow for multiple expressions in a block. You could use an assignment statement to store the returned value in a temporary variable so you don't run afoul of that rule like `_ = print("Hello, World"!)`. Another option would be to add a [block:] form which does allow multiple expressions. A spy statement doesn't have these limitations.

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

```exercism/advanced
Pyret doesn't easily support overwriting this default representation. Objects do have a hidden `_output` method which controls how they are displayed on the online.  When implementing this method, be aware that Pyret will expect a `ValueSkeleton` variant to be returned. For these purposes, we can either use `vs-value` or `vs-str`.  `vs-value` will take any value and properly escape characters, adding quotes for strings. `vs-str` only takes a string and will print characters exactly as written, not escaping any characters or wrapping the string in quotes.

Do note that this doesn't return an actual Pyret string that you can compare to another Pyret string. This is why there is an to-string() method expected for Clocks that will return a string representation the tests can check.
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

# Spying (at .../example.arr:15:0-15:16)
#   a: \
#   b: "\\"
#   c: 100
```

[data-declaration]: https://pyret.org/docs/latest/s_declarations.html#%28part._s~3adata-decl%29
[spy]: https://pyret.org/docs/latest/s_spies.html#%28idx._%28gentag._56%29%29
[block:]: https://pyret.org/docs/latest/Blocks.html#%28part._s~3ablocky-blocks%29
[equality]: https://pyret.org/docs/latest/equality.html
