# Introduction

There are two approaches highlighted here for his exercise.
Both involve checking if a year is evenly divisible by 4, 100, and 400 using [num-modulo][num-modulo].

## General guidance

Regardless of the approach chosen, this exercise requires students to use Boolean logic to decide if a given year is a leap year.

## Approach: Boolean chaining

```pyret
fun leap(year):
  fun year-is-divisible-by(divisor):
    num-equal(num-modulo(year, divisor), 0)
  end

  year-is-divisible-by(4) and (not(year-is-divisible-by(100)) or year-is-divisible-by(400))
end
```

For more information, check the [Boolean chain approach][approach-boolean-chain].

## Approach: If expressions

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

For more information, check the [if expressions approach][approach-if-expressions].

[num-modulo]: https://pyret.org/docs/latest/numbers.html#%28part._numbers_num-modulo%29
[approach-boolean-chain]: https://exercism.org/tracks/pyret/exercises/leap/approaches/boolean-chain
[approach-if-expressions]: https://exercism.org/tracks/pyret/exercises/leap/approaches/if-expressions