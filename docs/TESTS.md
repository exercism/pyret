
# Testing on the Pyret track

## Testing using the web editor

To run tests, just click the "Run Tests" button and all the tests will run.

## Testing locally

Before getting to work locally (i.e. not within the Exercism web editor), first make sure [pyret-npm] is installed and the `pyret` command works.
See [installation] for details about installing Pyret locally.

Each exercise has multiple tests.
When you first download the exercise, only one test will be enabled.
The recommended workflow is to run the test (which should initially fail), the make changes to your code until that test passes.
Then, enable the next test in the test file and repeat (modify the code, run tests, move on) until all the tests pass.
Some people prefer to preemptively enable all the tests before working on the code; this can overwhelm some people with how many tests are failing and make it hard to figure out what to work on, but this workflow works well for others.

### Running tests

Each exercise will have a solution file and a test file.
For instance, the Hello World exercise has a `hello-world.arr` file and a `hello-world-test.arr`.
To run tests, execute the `pyret` command with the test file as an argument.
For instance, running `pyret hello-world-test.arr` in the `hello-world` directory will run the Hello World exercises.

### Enabling tests

Every test file has one or more tests, each test wrapped in its own function.
The test file has a `TestRun` near the bottom of the file with a list of tests.
Each test in the list contains two values: the test function to run and an `active` value which controls if the test is executed.
For instance, the `etl-test.arr` file contains four tests, with the first active and the rest inactive.

```pyret
data TestRun: test(run, active) end

[list: 
  test(single-letter, true),
  test(single-score-multiple-letters, false),
  test(multiple-scores-multiple-letters, false),
  test(multiple-scores-different-numbers-of-letters, false)
].each(lam(t): when t.active: t.run() end end)
```

To enable additional tests, change the `active` value from `false` to `true` then rerun the test file with the `pyret` command.

Note: if you forget to enable all the tests, Pyret may report that all the (active) tests are passing locally but when you run your code on the website, Pyret may repor the tests are not passing (as it may be running additional tests which did not run locally).

Note: when running tests on the website, all the tests will always run.

## Debugging

In many languages, there is a common idiom of printing text to the screen during code execution.
This can trivially be done using the [print] function which prints the value passed to it and then returns that value.

Pyret by default doesn't allow for multiple expressions in a code block so you can't do this:

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

A more convenient approach is to use a [spy statement] which prints the contents and line numbers of the passed values.
Spies can be used without the `block` keyword.

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

You can also use a label with using `spy`:

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

You can also use multiple spies together:

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

## Notes

Tests on this track will `import` your file, allowing them access to anything explicitly exported from your code.

To export bindings, you need to add a [provide statement] on the first line that specifies that bindings in a comma-separated list like `provide foo, bar end` to allow the tests to import both `foo` and `bar`.
To import all bindings, you can use `provide *`, but generally that's not recommended because it may pollute the namespace and lead to [shadowing] which Pyret does not allow.

To export a custom type / data declaration, you instead should use a `provide-types statement` as `provide-types *`.
It is an error to try and provide a specific type here.

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
[installation]: https://exercism.org/docs/tracks/pyret/installation
