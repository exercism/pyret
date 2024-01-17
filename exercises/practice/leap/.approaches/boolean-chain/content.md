# Boolean chaining

```pyret
fun leap(year):
  fun year-is-divisible-by(divisor):
    num-equal(num-modulo(year, divisor), 0)
  end

  year-is-divisible-by(4) and (not(year-is-divisible-by(100)) or year-is-divisible-by(400))
end
```

This approach uses a helper function `year-is-divisible-by` and the Boolean operators `and` and `or` to run each check (divisible by 4, not divisible by 100, and divisible by 400) in order, producing a single Boolean value at the end.
The `and` operator returns `true` when both sides are true but `false` otherwise.
The `or` operator returns `false` when both sides are false but `true` otherwise.

|   n1  |   n2  | n1 OR n2 | n1 AND n2 |
| ----- | ----- | -------  | --------- |
| false | false |    false |     false |
| false | true  |     true |     false |
| true  | false |     true |     false |
| true  | true  |     true |      true | 

Both operators can short-circuit which means in some scenarios, the operators don't evaluate the expression to the right.
For `and`, if the left side produces `false`, that value is returned immediately.
For `or`, if the left side produces `true`, that value is returned immediately.

We can now test if a year is evenly divisible by 4, 100, and 400. 
All leap years are divisible by 4 but not by 100 unless they're also divisible by 100.

| year | year % 4 == 0 | year % 100 != 0 | year % 400 == 0 | is leap year |
| ---- | ------------- | --------------- | --------------- | ------------ |
| 2020 |          true |            true | (not evaluated) |         true |
| 2019 |         false | (not evaluated) | (not evaluated) |        false |
| 2000 |          true |           false |            true |         true |
| 1900 |          true |           false |           false |        false |
