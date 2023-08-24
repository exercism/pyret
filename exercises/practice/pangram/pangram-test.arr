use context essentials2020

include file("pangram.arr")

check "empty sentence":
  input = ""
  is-pangram(input) is-not true
end

check "perfect lower case":
  input = "abcdefghijklmnopqrstuvwxyz"
  is-pangram(input) is true
end

check "only lower case":
  input = "the quick brown fox jumps over the lazy dog"
  is-pangram(input) is true
end

check "missing the letter 'x'":
  input = "a quick movement of the enemy will jeopardize five gunboats"
  is-pangram(input) is-not true
end

check "missing the letter 'h'":
  input = "five boxing wizards jump quickly at it"
  is-pangram(input) is-not true
end

check "with underscores":
  input = "the_quick_brown_fox_jumps_over_the_lazy_dog"
  is-pangram(input) is true
end

check "with numbers":
  input = "the 1 quick brown fox jumps over the 2 lazy dogs"
  is-pangram(input) is true
end

check "missing letters replaced by numbers":
  input = "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"
  is-pangram(input) is false
end

check "mixed case and punctuation":
  input = "\"Five quacking Zephyrs jolt my wax bed.\""
  is-pangram(input) is true
end

check "a-m and A-M are 26 different characters but not a pangram":
  input = "abcdefghijklm ABCDEFGHIJKLM"
  is-pangram(input) is-not true
end
