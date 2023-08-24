use context essentials2020

include file("reverse-string.arr")

check "an empty string":
  reversed("") is ""
end

check "a word":
  reversed("robot") is "tobor"
end

check "a capitalized word":
  reversed("Ramen") is "nemaR"
end

check "a sentence with punctuation":
  reversed("I'm hungry!") is "!yrgnuh m'I"
end

check "a palindrome":
  reversed("racecar") is "racecar"
end

check "an even-sized word":
  reversed("drawer") is "reward"
end