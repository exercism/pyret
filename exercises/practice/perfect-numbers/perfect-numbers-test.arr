use context essentials2020

include file("perfect-numbers.arr")

#|
  When working offline, all tests except the first one are skipped by default.
  Once you get the first test running, unskip the next one until all tests pass locally.
  Check the block comment below for further details.
|#

fun smallest-perfect():
  check "Perfect numbers -> Smallest perfect number is classified correctly":
    classify(6) is "perfect"
  end
end

fun medium-perfect-number():
  check "Perfect numbers -> Medium perfect number is classified correctly":
    classify(28) is "perfect"
  end
end

fun large-perfect-number():
  check "Perfect numbers -> Large perfect number is classified correctly":
    classify(33550336) is "perfect"
  end
end

fun smallest-abundant():
  check "Abundant numbers -> Smallest abundant number is classified correctly":
    classify(12) is "abundant"
  end
end

fun medium-abundant():
  check "Abundant numbers -> Medium abundant number is classified correctly":
    classify(30) is "abundant"
  end
end

fun large-abundant():
  check "Abundant numbers -> Large abundant number is classified correctly":
    classify(33550335) is "abundant"
  end
end

fun perfect-square-abundant():
  check "Abundant numbers -> Perfect square abundant number is classified correctly":
    classify(196) is "abundant"
  end
end

fun smallest-prime-deficient():
  check "Deficient numbers -> Smallest prime deficient number is classified correctly":
    classify(2) is "deficient"
  end
end

fun smallest-non-prime-deficient():
  check "Deficient numbers -> Smallest non-prime deficient number is classified correctly":
    classify(4) is "deficient"
  end
end

fun medium-deficient():
  check "Deficient numbers -> Medium deficient number is classified correctly":
    classify(32) is "deficient"
  end
end

fun large-deficient():
  check "Deficient numbers -> Large deficient number is classified correctly":
    classify(33550337) is "deficient"
  end
end

fun one-is-deficient():
  check "Deficient numbers -> Edge case (no factors other than itself) is classified correctly":
    classify(1) is "deficient"
  end
end

fun reject-zero():
  check "Invalid inputs -> Zero is rejected (as it is not a positive integer)":
    classify(0) raises "Classification is only possible for positive integers."
  end
end

fun reject-negative():
  check "Invalid inputs -> Negative integer is rejected (as it is not a positive integer)":
    classify(-1) raises "Classification is only possible for positive integers."
  end
end

#|
  Code to run each test. Each line corresponds to a test above and whether it should be run.
  To mark a test to be run, replace `false` with `true` on that same line after the comma.
  test(test-a, true) will be run. test(test-a, false) will be skipped.
|#

data TestRun: test(run, active) end

[list: 
  test(smallest-perfect, true),
  test(medium-perfect-number, false),
  test(large-perfect-number, false),
  test(smallest-abundant, false),
  test(medium-abundant, false),
  test(large-abundant, false),
  test(perfect-square-abundant, false),
  test(smallest-prime-deficient, false),
  test(smallest-non-prime-deficient, false),
  test(medium-deficient, false),
  test(large-deficient, false),
  test(one-is-deficient, false),
  test(reject-zero, false),
  test(reject-negative, false)
].each(lam(t): when t.active: t.run() end end)
