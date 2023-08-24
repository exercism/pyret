use context essentials2020

include file("raindrops.arr")

check "the sound for 1 is 1":
  convert(1) is "1"
end

check "the sound for 3 is Pling":
  convert(3) is "Pling"
end

check "the sound for 5 is Plang":
  convert(5) is "Plang"
end

check "the sound for 7 is Plong":
  convert(7) is "Plong"
end

check "the sound for 6 is Pling as it has a factor 3":
  convert(6) is "Pling"
end

check "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base":
  convert(8) is "8"
end

check "the sound for 9 is Pling as it has a factor 3":
  convert(9) is "Pling"
end

check "the sound for 10 is Plang as it has a factor 5":
  convert(10) is "Plang"
end

check "the sound for 14 is Plong as it has a factor of 7":
  convert(14) is "Plong"
end

check "the sound for 15 is PlingPlang as it has factors 3 and 5":
  convert(15) is "PlingPlang"
end

check "the sound for 21 is PlingPlong as it has factors 3 and 7":
  convert(21) is "PlingPlong"
end

check "the sound for 25 is Plang as it has a factor 5":
  convert(25) is "Plang"
end

check "the sound for 27 is Pling as it has a factor 3":
  convert(27) is "Pling"
end

check "the sound for 35 is PlangPlong as it has factors 5 and 7":
  convert(35) is "PlangPlong"
end

check "the sound for 49 is Plong as it has a factor 7":
  convert(49) is "Plong"
end

check "the sound for 52 is 52":
  convert(52) is "52"
end

check "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7":
  convert(105) is "PlingPlangPlong"
end

check "the sound for 3125 is Plang as it has a factor 5":
  convert(3125) is "Plang"
end
