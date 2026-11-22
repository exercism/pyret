use context starter2024

include file("scrabble-score.arr")

check "lowercase letter":
  word = "a"
  expected = 1

  score(word) is expected
end

check "uppercase letter":
  word = "A"
  expected = 1

  score(word) is expected
end

check "valuable letter":
  word = "f"
  expected = 4

  score(word) is expected
end

check "short word":
  word = "at"
  expected = 2

  score(word) is expected
end

check "short, valuable word":
  word = "zoo"
  expected = 12

  score(word) is expected
end

check "medium word":
  word = "street"
  expected = 6

  score(word) is expected
end

check "medium, valuable word":
  word = "quirky"
  expected = 22

  score(word) is expected
end

check "long, mixed-case word":
  word = "OxyphenButazone"
  expected = 41

  score(word) is expected
end

check "english-like word":
  word = "pinata"
  expected = 8

  score(word) is expected
end

check "empty input":
  word = ""
  expected = 0

  score(word) is expected
end

check "entire alphabet available":
  word = "abcdefghijklmnopqrstuvwxyz"
  expected = 87

  score(word) is expected
end
