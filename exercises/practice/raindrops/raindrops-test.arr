use context starter2024

include file("raindrops.arr")

check "the sound for 1 is 1":
  number = 1
  expected = "1"

  convert(number) is expected
end

check "the sound for 3 is Pling":
  number = 3
  expected = "Pling"

  convert(number) is expected
end

check "the sound for 5 is Plang":
  number = 5
  expected = "Plang"

  convert(number) is expected
end

check "the sound for 7 is Plong":
  number = 7
  expected = "Plong"

  convert(number) is expected
end

check "the sound for 6 is Pling as it has a factor 3":
  number = 6
  expected = "Pling"

  convert(number) is expected
end

check "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base":
  number = 8
  expected = "8"

  convert(number) is expected
end

check "the sound for 9 is Pling as it has a factor 3":
  number = 9
  expected = "Pling"

  convert(number) is expected
end

check "the sound for 10 is Plang as it has a factor 5":
  number = 10
  expected = "Plang"

  convert(number) is expected
end

check "the sound for 14 is Plong as it has a factor of 7":
  number = 14
  expected = "Plong"

  convert(number) is expected
end

check "the sound for 15 is PlingPlang as it has factors 3 and 5":
  number = 15
  expected = "PlingPlang"

  convert(number) is expected
end

check "the sound for 21 is PlingPlong as it has factors 3 and 7":
  number = 21
  expected = "PlingPlong"

  convert(number) is expected
end

check "the sound for 25 is Plang as it has a factor 5":
  number = 25
  expected = "Plang"

  convert(number) is expected
end

check "the sound for 27 is Pling as it has a factor 3":
  number = 27
  expected = "Pling"

  convert(number) is expected
end

check "the sound for 35 is PlangPlong as it has factors 5 and 7":
  number = 35
  expected = "PlangPlong"

  convert(number) is expected
end

check "the sound for 49 is Plong as it has a factor 7":
  number = 49
  expected = "Plong"

  convert(number) is expected
end

check "the sound for 52 is 52":
  number = 52
  expected = "52"

  convert(number) is expected
end

check "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7":
  number = 105
  expected = "PlingPlangPlong"

  convert(number) is expected
end

check "the sound for 3125 is Plang as it has a factor 5":
  number = 3125
  expected = "Plang"

  convert(number) is expected
end
