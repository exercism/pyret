include file("hamming.arr")

check "empty strands":
  distance("", "") is 0
end

check "single letter identical strands":
  distance("A", "A") is 0
end

check "single letter different strands":
  distance("G", "T") is 1
end

check "long identical strands":
  distance("GGACTGAAATCTG", "GGACTGAAATCTG") is 0
end

check "long different strands":
  distance("GGACGGATTCTG", "AGGACGGATTCT") is 9
end

check "disallow first strand longer":
  distance("AATG", "AAA") raises "Strands must be of equal length."
end

check "disallow second strand longer":
  distance("ATA", "AGTG") raises "Strands must be of equal length."
end

check "disallow empty first strand":
  distance("", "G") raises "Strands must be of equal length."
end

check "disallow empty second strand":
  distance("G", "") raises "Strands must be of equal length."
end
