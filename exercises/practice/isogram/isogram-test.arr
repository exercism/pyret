use context essentials2020

include file("isogram.arr")

check "empty string":
  is-isogram("") is true
end

check "isogram with only lower case characters":
  is-isogram("isogram") is true
end

check "word with one duplicated character":
  is-isogram("eleven") is-not true
end

check "word with one duplicated character from the end of the alphabet":
  is-isogram("zzyzx") is-not true
end

check "longest reported english isogram":
  is-isogram("subdermatoglyphic") is true
end

check "word with duplicated character in mixed case":
  is-isogram("Alphabet") is-not true
end

check "word with duplicated character in mixed case, lowercase first":
  is-isogram("alphAbet") is-not true
end

check "hypothetical isogrammic word with hyphen":
  is-isogram("thumbscrew-japingly") is true
end

check "hypothetical word with duplicated character following hyphen":
  is-isogram("thumbscrew-jappingly") is-not true
end

check "isogram with duplicated hyphen":
  is-isogram("six-year-old") is true
end

check "made-up name that is an isogram":
  is-isogram("Emily Jung Schwartzkopf") is true
end

check "duplicated character in the middle":
  is-isogram("accentor") is-not true
end

check "same first and last characters":
  is-isogram("angola") is-not true
end

check "word with duplicated character and with two hyphens":
  is-isogram("up-to-date") is-not true
end
