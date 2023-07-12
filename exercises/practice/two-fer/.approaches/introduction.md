# Introduction

There are generally two approaches for solving Two Fer.
One approach would be using an [`if expression`][if-expression] to test a passed-in value.
A variant of this approach would be an [`ask expression`][ask-expression] to concisely write the `if expression`.

## General guidance

Regardless of the approach used, Pyret doesn't allow one to [re-assign a variable binding][shadowing] that is already in scope
Therefore, you can't rebind `name`.


## Approach: `if` expressions

```pyret
fun two-fer(name):
  fun get-name():
    if name == "":
      "you"
    else:
      name
    end
  end

  "One for " + get-name() + ", one for me."
end


```

## Approach: `ask` expressions

```pyret
fun two-fer(name):
  fun get-name():
    ask:
      | name == "" then: "you"
      | otherwise: name
    end
  end

  "One for " + get-name() + ", one for me."
end

```

## Other approaches

Besides the aforementioned, idiomatic approaches, you could also approach the exercise as follows:

### Other approach: Option datatypes

Pyret provides a type of data called an [`Option`][option-datatype] that can represent a piece of data that is or is not available. The value `none` represents missing or invalid data and `some` wraps around data that is present. An empty incoming string `""` is still considered valid data so we'd need to replace it with `none`. Once we've done that, we can use [`or-else`][or-else] to either return the wrapped value or provide a default value when the Option is `none`.

```pyret
fun two-fer(name):
  fun get-option():
    if name == "":
      none
    else:
      some(name)
    end
  end

  option = get-option()
  "One for " + option.or-else("you") + ", one for me."
end

```

## Which approach to use?

Either the `ask` or `if` expressions work well here and work similarly so the decision is largely stylistic.

[if-expression]: https://pyret.org/docs/latest/Expressions.html#%28elem._%28bnf-prod._%28.Pyret._if-expr%29%29%29
[ask-expression]: https://pyret.org/docs/latest/Expressions.html#%28part._s~3aask-expr%29
[shadowing]: https://pyret.org/docs/latest/Bindings.html#%28part._s~3ashadowing%29
[option-datatype]: https://pyret.org/docs/latest/option.html
[or-else]: https://pyret.org/docs/latest/option.html#%28idx._%28gentag._342%29%29
