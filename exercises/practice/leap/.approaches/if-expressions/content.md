# If expressions

```pyret
fun leap(year):
  if num-equal(num-modulo(year, 400), 0):
    true
  else if num-equal(num-modulo(year, 100), 0):
    false
  else if num-equal(num-modulo(year, 4), 0):
    true
  else:
    false
end
```

An [if expression][if-expression] contains one or more branches with conditions that are checked sequentially and associated blocks of code.
Once a condition produces `true`, the associated block is evaluated and its contents returned.
No subsequent conditions will be tested.
One of the conditions in the if expression must produce `true` or an error is thrown.
Therefore, `else` is used to provide a branch that is evaluated when the other branches' conditions aren't satisified.

If a year is evenly divisible by 400, the first condition `num-equal(num-modulo(year, 400), 0)` produces `true`, and the associated block is evaluated, returning `true`.

If a year is divisible by 100, the second condition `num-equal(num-modulo(year, 100), 0)` produces `true`, and the associated block is evaluated, returning `false`. If this year had also been divisible by 400, the first condition would have been satisfied and the code would not have reached this point.

If a year is divisible by 4, the third condition `num-equal(num-modulo(year, 4), 0)` produces `true`, and the associated block is evaluated, returning `true`.
Because of the previous conditions, this year isn't also divisible by 400 or 100.

Finally, if no other branches' conditions were true, the block associated with `else` is evaluated, representing when a year isn't divisible by 4, 100, or 400.
Here, `false` is returned.

[if-expression]: https://pyret.org/docs/latest/Expressions.html#%28part._s~3aif-expr%29
