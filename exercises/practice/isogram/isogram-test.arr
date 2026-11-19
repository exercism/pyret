use context starter2024

include file("isogram.arr")

check "empty string":
  phrase = ""
  expected = true

  is-isogram(phrase) is expected
end

check "isogram with only lower case characters":
  phrase = "isogram"
  expected = true

  is-isogram(phrase) is expected
end

check "word with one duplicated character":
  phrase = "eleven"
  expected = false

  is-isogram(phrase) is expected
end

check "word with one duplicated character from the end of the alphabet":
  phrase = "zzyzx"
  expected = false

  is-isogram(phrase) is expected
end

check "longest reported english isogram":
  phrase = "subdermatoglyphic"
  expected = true

  is-isogram(phrase) is expected
end

check "word with duplicated character in mixed case":
  phrase = "Alphabet"
  expected = false

  is-isogram(phrase) is expected
end

check "word with duplicated character in mixed case, lowercase first":
  phrase = "alphAbet"
  expected = false

  is-isogram(phrase) is expected
end

check "hypothetical isogrammic word with hyphen":
  phrase = "thumbscrew-japingly"
  expected = true

  is-isogram(phrase) is expected
end

check "hypothetical word with duplicated character following hyphen":
  phrase = "thumbscrew-jappingly"
  expected = false

  is-isogram(phrase) is expected
end

check "isogram with duplicated hyphen":
  phrase = "six-year-old"
  expected = true

  is-isogram(phrase) is expected
end

check "made-up name that is an isogram":
  phrase = "Emily Jung Schwartzkopf"
  expected = true

  is-isogram(phrase) is expected
end

check "duplicated character in the middle":
  phrase = "accentor"
  expected = false

  is-isogram(phrase) is expected
end

check "same first and last characters":
  phrase = "angola"
  expected = false

  is-isogram(phrase) is expected
end

check "word with duplicated character and with two hyphens":
  phrase = "up-to-date"
  expected = false

  is-isogram(phrase) is expected
end
