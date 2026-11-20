use context starter2024

include file("collatz-conjecture.arr")

check "zero steps for one":
  number = 1
  expected = 0

  steps(number) is expected
end

check "divide if even":
  number = 16
  expected = 4

  steps(number) is expected
end

check "even and odd steps":
  number = 12
  expected = 9

  steps(number) is expected
end

check "large number of even and odd steps":
  number = 1000000
  expected = 152

  steps(number) is expected
end

check "zero is an error":
  number = 0

  steps(number) raises "Only positive integers are allowed"
end

check "negative value is an error":
  number = -15

  steps(number) raises "Only positive integers are allowed"
end
