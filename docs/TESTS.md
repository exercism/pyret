
# Testing on the Pyret track

## Getting Started

After you successfully download an exercise, there will be several files inside, but the most two important are your solution and test files.
In the following example, we've downloaded the Leap exercise.

```bash
leap/
├── leap.arr       # Solution file - your code goes here
├── leap-test.arr  # Test cases for the exercise
```

To run the tests, either use `exercism test` if you've downloaded the official Exercism CLI or run `pyret leap-test.arr`.
Pyret will run the test suite which consists of a series of labeled `check` blocks that test your solution file against specific inputs and expected results.
A critical part of this process is explicitly exporting portions of your code so the test suite can see it.

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

[provide-statement]: https://pyret.org/docs/latest/Provide_Statements.html
[shadowing]: https://pyret.org/docs/latest/Bindings.html#%28part._s~3ashadowing%29
[data-definition]: https://pyret.org/docs/latest/s_declarations.html#%28elem._%28bnf-prod._%28.Pyret._data-decl%29%29%29
[provide-types-statement]: https://pyret.org/docs/latest/Provide_Statements.html
