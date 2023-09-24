use context essentials2020

include file("reverse-string.arr")

#|
  When working offline, all tests except the first one are skipped by default.
  Once you get the first test running, unskip the next one until all tests pass locally.
  Check the block comment below for further details.
|#

fun empty-string():
  check "an empty string":
    reversed("") is ""
  end
end

fun word():
  check "a word":
    reversed("robot") is "tobor"
  end
end

fun capitalized-word():
  check "a capitalized word":
    reversed("Ramen") is "nemaR"
  end
end

fun sentence-with-punctuation():
  check "a sentence with punctuation":
    reversed("I'm hungry!") is "!yrgnuh m'I"
  end
end

fun palindrome():
  check "a palindrome":
    reversed("racecar") is "racecar"
  end
end

fun even-sized-word():
  check "an even-sized word":
    reversed("drawer") is "reward"
  end
end

#|
  Code to run each test. Each line corresponds to a test above and whether it should be run.
  To mark a test to be run, replace `false` with `true` on that same line after the comma.
  test(test-a, true) will be run. test(test-a, false) will be skipped.
|#

data TestRun: test(run, active) end

[list: 
  test(empty-string, true),
  test(word, false),
  test(capitalized-word, false),
  test(sentence-with-punctuation, false),
  test(palindrome, false),
  test(even-sized-word, false)
].each(lam(t): when t.active: t.run() end end)
