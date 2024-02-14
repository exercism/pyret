
# Testing on the Pyret track

## Testing using the web editor

To run tests, click the "Run Tests" button and all the tests will be run.

## Testing locally

Before working locally, see the [installation docs][installation] to set up Pyret.

Each exercise has multiple tests.
When you first download the exercise, only one test will be enabled.
The recommended workflow is to run the test (which should initially fail) and then make changes to your code until that test passes.
Then, enable the next test in the test file (see below for details) and repeat this process(modify the code, run tests, and move on) until all the tests pass.
Some students preemptively enable all the tests before working on the code; this can be overwhelming with how many tests are failing and make it harder to solve the exercise.

### Running tests

Each exercise will have a solution file and a test file.
For instance, the Hello World exercise has both a `hello-world.arr` file and a `hello-world-test.arr` file.
Your code will go into `hello-world.arr`.
To run tests, execute the `pyret` command with the test file as an argument.
For instance, running `pyret hello-world-test.arr` in the `hello-world` directory will run the currently enabled Hello World tests.

### Enabling tests

Every test file has one or more tests, each test wrapped in its own function.
At the bottom, there is a list of `TestRun` values representing the tests to be run. 
Each test in the list contains two values: the test function to run and an `active` value which controls whether the test will be executed.
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

To enable additional tests, change the `active` value from `false` to `true`, and then rerun the test file with the `pyret` command.

~~~~exercism/note
If whle working offline you forget to enable all the tests, Pyret may report that all the (active) tests are passing locally.
When you submit your code, the website may report some tests are not passing (as it may be running additional tests which did not run locally).
~~~~

## provide

Tests on this track will import your file, allowing access to anything explicitly exported from your code.

To export variables, you need to add a [provide statement][provide-statement] at the beginning of your file.

The following snippets are three valid ways to export `a`, `b`, and `c`.

```pyret
# using a list of bindings
provide a, b, c end
```

```pyret
# using an object literal
provide {
  a: a,
  b: b,
  c: c
}
end
```

`provide *` is a shorthand for exporting all the top-level bindings except for custom data types
However, it's generally not recommended because Pyret is strict about not allowing [shadowing][shadowing].

## provide-types

Some exercises will require a [custom data type][data-definition] to be exported for testing purposes.
In those situations, you can use a [provide-types statement][provide-types-statement].
Since a data type has additional functions that might not be exported, it's advised to use `provide-types *` despite the shadowing concern.

```pyret
provide-types *

data MyPoint:
  | two-dim(x, y)
  | three-dim(x, y, z)
end
```

All exercise stubs will have either `provide` or `provide-types` statements set up for your use.

[installation]: https://exercism.org/docs/tracks/pyret/installation
[provide-statement]: https://pyret.org/docs/latest/Provide_Statements.html
[shadowing]: https://pyret.org/docs/latest/Bindings.html#%28part._s~3ashadowing%29
[data-definition]: https://pyret.org/docs/latest/s_declarations.html#%28elem._%28bnf-prod._%28.Pyret._data-decl%29%29%29
[provide-types-statement]: https://pyret.org/docs/latest/Provide_Statements.html


