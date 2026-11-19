use context starter2024

include file("acronym.arr")

check "basic":
  phrase = "Portable Network Graphics"
  abbreviate(phrase) is "PNG"
end

check "lowercase words":
  abbreviate("Ruby on Rails") is "ROR"
end

check "punctuation":
  abbreviate("First In, First Out") is "FIFO"
end

check "all caps word":
  phrase = "GNU Image Manipulation Program"

  abbreviate(phrase) is "GIMP"
end

check "punctuation without whitespace":
  phrase = "Complementary metal-oxide semiconductor"

  abbreviate(phrase) is "CMOS"
end

check "very long abbreviation":
  phrase = "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"

  abbreviate(phrase) is "ROTFLSHTMDCOALM"
end

check "consecutive delimiters":
  phrase = "Something - I made up from thin air"

  abbreviate(phrase) is "SIMUFTA"
end

check "apostrophes":
  abbreviate("Halley's Comet") is "HC"
end

check "underscore emphasis":
  abbreviate("The Road _Not_ Taken") is "TRNT"
end
