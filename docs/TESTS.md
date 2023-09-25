# Tests

When working locally (i.e. not within the Exercism web editor), first make sure [pyret-npm] is installed and accessible. Then execute the tests by passing `pyret` the location of the test file relative to your current working directory like
`$ pyret relative/path/to/example-test.arr`.

On this track, Pyret check blocks are wrapped in functions to delay detection and execution. Those functions are stored as a TestRun value with a field for the function and another field for whether it should be run. When working locally, this second field should be set to `true` instead of `false` if you want to run a specific test. On the Exercism website, all TestRun values are run regardless of that second field's contents so a solution passing locally may not pass on the website if all the local tessts haven't been enabled.

In the below example, the first TestRun value `test(foo, true)` has true for the `active` field so Pyret will invoke the stored function, evaluating the check block inside it. The second TestRun value `test(bar, false)` has false for the same field so Pyret won't invoke the bar function. As a consequence, Pyret will locally report the single test seen as passed. However, when you submit your solution, the Exercism website runs both tests, and the second one will fail. To avoid this issue, enable each test as you work on your solution locally by changing the corresponding TestRun's active field to true. If all the tests are enabled locally and pass, so should the tests on the website once you submit the solution.

```pyret

fun foo():
  check "foo":
    true is true
  end
end

fun bar():
  check "bar":
    false is true
  end
end

data TestRun: test(run, active) end

[list: 
  test(foo, true),
  test(bar, false)
].each(lam(t): when t.active: t.run() end end)
```

# Skipping Tests

When working through the Exercism web editor, all tests defined in the test file will be run. When working offline, only the first test is enabled by default.

# Debugging

In many languages, there is a common idiom of printing text to the screen during code execution. This can trivially be done using the
[print] function which prints its provided value and then returns it.

However, Pyret by default doesn't allow for multiple expressions in a code block so you can't do this:

```pyret
fun add-two-numbers(number1, number2):
  print("I'm in a function!")
  number1 + number2
end
```

Instead, we need to use the `block` form to encapsulate a section with multiple expressions:

```pyret
fun add-two-numbers(number1, number2):
  block:
    print("I'm in a function!")
    number1 + number2
  end
end

print(add-two-number(1, 2))
"I'm in a function!"
3
```

A more convenient approach is to use a [spy statement] which prints the contents and line numbers of the passed values. It doesn't require the block keyword to be used.

```pyret
fun add-two-numbers(number1, number2):
  spy: number1, number2 end
  number1 + number2
end

print(add-two-numbers(1, 2))
Spying (at .../add-two-numbers.arr:2:2-2:27)
  number1: 1
  number2: 2
3
```

A label can also be used:

```pyret
fun add-two-numbers(number1, number2):
  spy "adding two": number1, number2 end
  number1 + number2
end

print(add-two-numbers(1, 2))
Spying "adding two" (at .../add-two-numbers.arr:2:2-2:27)
  number1: 1
  number2: 2
3
```

You can also use multiple spies:

```pyret
fun do-math(number1, number2):
  added = number1 + number2
  subtracted = number1 - number2
  spy "args": number1, number2 end
  spy "adding": added end
  spy "subtracting": subtracted end
  true
end

print(do-math(1, 2))
Spying "args" (at .../math.arr:4:2-4:36)
  number1: 1
  number2: 2
Spying "adding" (at .../math.arr:5:2-5:25)
  added: 3
Spying "subtracting" (at .../math.arr:6:2-6:35)
  subtracted: -1
true
```

# Notes

Tests on this track will `import` your file, allowing them access to anything explicitly exported from your code.

To export bindings, you need to add a [provide statement] on the first line that specifies that bindings in a comma-separated list like `provide foo, bar end` to allow the tests to import both `foo` and `bar`. To import all bindings, you can use `provide *`, but generally that's not recommended because it may pollute the namespace and lead to [shadowing] which Pyret does not allow.

To export a custom type / data declaration, you instead should use a `provide-types statement` as `provide-types *`. It is an error to try and provide

```pyret
provide-types *

data Point:
  | two-dim(x, y)
  | three-dim(x, y, z)
end
```

All exercise stubs will have either `provide` or `provide-types` statements set up for your use.

[pyret-npm]: https://npm.io/package/pyret-npm
[print]: https://pyret.org/docs/latest/_global_.html#%28part._~3cglobal~3e_print%29
[spy statement]: https://pyret.org/docs/latest/s_spies.html
[provide statement]: https://pyret.org/docs/latest/Provide_Statements.html
[shadowing]: https://pyret.org/docs/latest/Bindings.html#%28part._s~3ashadowing%29
