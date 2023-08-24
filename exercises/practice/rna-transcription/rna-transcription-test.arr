use context essentials2020

include file("rna-transcription.arr")

check "Empty RNA sequence":
  to-rna("") is ""
end
check "RNA complement of cytosine is guanine":
  to-rna("C") is "G"
end

check "RNA complement of guanine is cytosine":
  to-rna("G") is "C"
end

check "RNA complement of thymine is adenine":
  to-rna("T") is "A"
end

check "RNA complement of adenine is uracil":
  to-rna("A") is "U"
end

check "RNA complement":
  to-rna("ACGTGGTCTTAA") is "UGCACCAGAAUU"
end
