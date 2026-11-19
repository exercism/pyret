use context starter2024

include file("perfect-numbers.arr")

check "Perfect numbers -> Smallest perfect number is classified correctly":
  number = 6
  expected = "perfect"

  classify(number) is expected
end

check "Perfect numbers -> Medium perfect number is classified correctly":
  number = 28
  expected = "perfect"

  classify(number) is expected
end

check "Perfect numbers -> Large perfect number is classified correctly":
  number = 33550336
  expected = "perfect"

  classify(number) is expected
end

check "Abundant numbers -> Smallest abundant number is classified correctly":
  number = 12
  expected = "abundant"

  classify(number) is expected
end

check "Abundant numbers -> Medium abundant number is classified correctly":
  number = 30
  expected = "abundant"

  classify(number) is expected
end

check "Abundant numbers -> Large abundant number is classified correctly":
  number = 33550335
  expected = "abundant"

  classify(number) is expected
end

check "Abundant numbers -> Perfect square abundant number is classified correctly":
  number = 196
  expected = "abundant"

  classify(number) is expected
end

check "Deficient numbers -> Smallest prime deficient number is classified correctly":
  number = 2
  expected = "deficient"

  classify(number) is expected
end

check "Deficient numbers -> Smallest non-prime deficient number is classified correctly":
  number = 4
  expected = "deficient"

  classify(number) is expected
end

check "Deficient numbers -> Medium deficient number is classified correctly":
  number = 32
  expected = "deficient"

  classify(number) is expected
end

check "Deficient numbers -> Large deficient number is classified correctly":
  number = 33550337
  expected = "deficient"

  classify(number) is expected
end

check "Deficient numbers -> Edge case (no factors other than itself) is classified correctly":
  number = 1
  expected = "deficient"

  classify(number) is expected
end

check "Invalid inputs -> Zero is rejected (as it is not a positive integer)":
  number = 0

  classify(number) raises "Classification is only possible for positive integers."
end

check "Invalid inputs -> Negative integer is rejected (as it is not a positive integer)":
  number = -1

  classify(number) raises "Classification is only possible for positive integers."
end
