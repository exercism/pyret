use context essentials2020

include file("collatz-conjecture.arr")

check "zero steps for one":
    steps(1) is 0
end

check "divide if even":
  steps(16) is 4
end

check "even and odd steps":
  steps(12) is 9
end

check "large number of even and odd steps":
  steps(1000000) is 152
end

check "zero is an error":
  steps(0) raises "Only positive numbers are allowed"
end

check "negative value is an error":
  steps(-15) raises "Only positive numbers are allowed"
end
