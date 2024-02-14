# Debug

```pyret
fun print-forty-two():
  print(42) # 42
end
```

```pyret
fun return-forty-two() block:
  print(42) # 42
  42
end
```

[print][print] is an expression returning a value.
Pyret only allows a single expression within a given block of code unless the outer block is marked with `block`.
In the second example, adding `block` to the function declaration allows us to print 42 before returning it.

## Spies

```pyret
fun do-something():
    x = "foo"
    y = "bar"
    spy "strings": x, y end
    a = 1
    b = 2
    spy "numbers": a, b end
end
do-something();

# Spying "strings" (at <clipped>/example.arr:4:4-4:27)
#  x: "foo"
#  y: "bar"
# Spying "numbers" (at <clipped>/example.arr:7:4-7:27)
#  a: 1
#  b: 2
```

A spy statement takes an optional label, one or more variables and reports each variable and its value.
Because it's not an expression, a spy can be used in a block without requiring the outer block to be marked with `block`.

[print]: https://pyret.org/docs/latest/_global_.html#%28idx._%28gentag._57%29%29
[spy]: https://pyret.org/docs/latest/s_spies.html
