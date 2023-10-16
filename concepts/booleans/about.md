# Introduction

Pyret has two distinct Boolean primitives, `true` and `false`.
These two values represent whether a statement or condition is valid or not.

```pyret
"a" == "a" # true
"a" == "b" # false
```

Pyret provides the operators `and` and `or` that can combine Boolean values.

The and operator returns true if both sides are true and false for all other combinations.

```pyret
true and true # true
true and false # true
false and true # false
false and false # false
```

The or operator returns true if at least one side is true and false if both sides are false.

```pyret
true or true # true
true or false # true
false or true # true
false or false # false
```

`not()` is a built-in function that flips a true to false or a false to true.

```pyret
not(true) # false
not(false) # true
```
