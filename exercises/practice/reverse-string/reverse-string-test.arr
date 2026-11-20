use context starter2024

include file("reverse-string.arr")

check "an empty string":
  value = ""
  expected = ""

  reversed(value) is expected
end

check "a word":
  value = "robot"
  expected = "tobor"

  reversed(value) is expected
end

check "a capitalized word":
  value = "Ramen"
  expected = "nemaR"

  reversed(value) is expected
end

check "a sentence with punctuation":
  value = "I'm hungry!"
  expected = "!yrgnuh m'I"

  reversed(value) is expected
end

check "a palindrome":
  value = "racecar"
  expected = "racecar"

  reversed(value) is expected
end

check "an even-sized word":
  value = "drawer"
  expected = "reward"

  reversed(value) is expected
end
