use context starter2024

include file("acronym.arr")

check "basic":
  phrase = "Portable Network Graphics"
  expected = "PNG"

  abbreviate(phrase) is expected
end

check "lowercase words":
  phrase = "Ruby on Rails"
  expected = "ROR"

  abbreviate(phrase) is expected
end

check "punctuation":
  phrase = "First In, First Out"
  expected = "FIFO"

  abbreviate(phrase) is expected
end

check "all caps word":
  phrase = "GNU Image Manipulation Program"
  expected = "GIMP"

  abbreviate(phrase) is expected
end

check "punctuation without whitespace":
  phrase = "Complementary metal-oxide semiconductor"
  expected = "CMOS"

  abbreviate(phrase) is expected
end

check "very long abbreviation":
  phrase = "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"
  expected = "ROTFLSHTMDCOALM"

  abbreviate(phrase) is expected
end

check "consecutive delimiters":
  phrase = "Something - I made up from thin air"
  expected = "SIMUFTA"

  abbreviate(phrase) is expected
end

check "apostrophes":
  phrase = "Halley's Comet"
  expected = "HC"

  abbreviate(phrase) is expected
end

check "underscore emphasis":
  phrase = "The Road _Not_ Taken"
  expected = "TRNT"

  abbreviate(phrase) is expected
end
