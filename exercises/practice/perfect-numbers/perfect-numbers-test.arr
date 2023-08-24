use context essentials2020

include file("perfect-numbers.arr")

check "Perfect numbers -> Smallest perfect number is classified correctly":
  classify(6) is "perfect"
end

check "Perfect numbers -> Medium perfect number is classified correctly":
  classify(28) is "perfect"
end

check "Perfect numbers -> Large perfect number is classified correctly":
  classify(33550336) is "perfect"
end

check "Abundant numbers -> Smallest abundant number is classified correctly":
  classify(12) is "abundant"
end

check "Abundant numbers -> Medium abundant number is classified correctly":
  classify(30) is "abundant"
end

check "Abundant numbers -> Large abundant number is classified correctly":
  classify(33550335) is "abundant"
end

check "Deficient numbers -> Smallest prime deficient number is classified correctly":
  classify(2) is "deficient"
end

check "Deficient numbers -> Smallest non-prime deficient number is classified correctly":
  classify(4) is "deficient"
end

check "Deficient numbers -> Medium deficient number is classified correctly":
  classify(32) is "deficient"
end

check "Deficient numbers -> Large deficient number is classified correctly":
  classify(33550337) is "deficient"
end

check "Deficient numbers -> Edge case (no factors other than itself) is classified correctly":
  classify(1) is "deficient"
end

check "Invalid inputs -> Zero is rejected (as it is not a positive integer)":
  classify(0) raises "Classification is only possible for positive integers."
end

check "Invalid inputs -> Negative integer is rejected (as it is not a positive integer)":
  classify(-1) raises "Classification is only possible for positive integers."
end
