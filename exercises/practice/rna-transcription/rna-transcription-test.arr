use context starter2024

include file("rna-transcription.arr")

check "Empty RNA sequence":
  dna = ""
  expected = ""

  to-rna(dna) is expected
end

check "RNA complement of cytosine is guanine":
  dna = "C"
  expected = "G"

  to-rna(dna) is expected
end

check "RNA complement of guanine is cytosine":
  dna = "G"
  expected = "C"

  to-rna(dna) is expected
end

check "RNA complement of thymine is adenine":
  dna = "T"
  expected = "A"

  to-rna(dna) is expected
end

check "RNA complement of adenine is uracil":
  dna = "A"
  expected = "U"

  to-rna(dna) is expected
end

check "RNA complement":
  dna = "ACGTGGTCTTAA"
  expected = "UGCACCAGAAUU"

  to-rna(dna) is expected
end
