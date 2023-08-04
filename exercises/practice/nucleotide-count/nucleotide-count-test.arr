include file("nucleotide-count.arr")

include string-dict

check "empty strand":
  input = ""
  expected = [string-dict: "A", 0, "C", 0, "G", 0, "T", 0]

  nucleotide-counts(input) is expected
end

check "can count one nucleotide in single-character input":
  input = "G"
  expected = [string-dict: "A", 0, "C", 0, "G", 1, "T", 0]

  nucleotide-counts(input) is expected
end

check "strand with repeated nucleotide":
  input = "GGGGGGG"
  expected = [string-dict: "A", 0, "C", 0, "G", 7, "T", 0]

  nucleotide-counts(input) is expected
end

check "strand with multiple nucleotides":
  input = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
  expected = [string-dict: "A", 20, "C", 12, "G", 17, "T", 21]

  nucleotide-counts(input) is expected
end

check "strand with invalid nucleotides":
  input = "AGXXACT"

  nucleotide-counts(input) raises "Invalid nucleotide in strand"
end