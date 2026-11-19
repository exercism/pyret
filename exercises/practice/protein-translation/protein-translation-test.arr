use context starter2024

include file("protein-translation.arr")

check "Empty RNA sequence results in no proteins":
  strand = ""
  expected = [list: ]

  proteins(strand) is expected
end

check "Methionine RNA sequence":
  strand = "AUG"
  expected = [list: "Methionine"]

  proteins(strand) is expected
end

check "Phenylalanine RNA sequence 1":
  strand = "UUU"
  expected = [list: "Phenylalanine"]

  proteins(strand) is expected
end

check "Phenylalanine RNA sequence 2":
  strand = "UUC"
  expected = [list: "Phenylalanine"]

  proteins(strand) is expected
end

check "Leucine RNA sequence 1":
  strand = "UUA"
  expected = [list: "Leucine"]

  proteins(strand) is expected
end

check "Leucine RNA sequence 2":
  strand = "UUG"
  expected = [list: "Leucine"]

  proteins(strand) is expected
end

check "Serine RNA sequence 1":
  strand = "UCU"
  expected = [list: "Serine"]

  proteins(strand) is expected
end

check "Serine RNA sequence 2":
  strand = "UCC"
  expected = [list: "Serine"]

  proteins(strand) is expected
end

check "Serine RNA sequence 3":
  strand = "UCA"
  expected = [list: "Serine"]

  proteins(strand) is expected
end

check "Serine RNA sequence 4":
  strand = "UCG"
  expected = [list: "Serine"]

  proteins(strand) is expected
end

check "Tyrosine RNA sequence 1":
  strand = "UAU"
  expected = [list: "Tyrosine"]

  proteins(strand) is expected
end

check "Tyrosine RNA sequence 2":
  strand = "UAC"
  expected = [list: "Tyrosine"]

  proteins(strand) is expected
end

check "Cysteine RNA sequence 1":
  strand = "UGU"
  expected = [list: "Cysteine"]

  proteins(strand) is expected
end

check "Cysteine RNA sequence 2":
  strand = "UGC"
  expected = [list: "Cysteine"]

  proteins(strand) is expected
end

check "Tryptophan RNA sequence":
  strand = "UGG"
  expected = [list: "Tryptophan"]

  proteins(strand) is expected
end

check "STOP codon RNA sequence 1":
  strand = "UAA"
  expected = [list: ]

  proteins(strand) is expected
end

check "STOP codon RNA sequence 2":
  strand = "UAG"
  expected = [list: ]

  proteins(strand) is expected
end

check "STOP codon RNA sequence 3":
  strand = "UGA"
  expected = [list: ]

  proteins(strand) is expected
end

check "Sequence of two protein codons translates into proteins":
  strand = "UUUUUU"
  expected = [list: "Phenylalanine", "Phenylalanine"]

  proteins(strand) is expected
end

check "Sequence of two different protein codons translates into proteins":
  strand = "UUAUUG"
  expected = [list: "Leucine", "Leucine"]

  proteins(strand) is expected
end

check "Translate RNA strand into correct protein list":
  strand = "AUGUUUUGG"
  expected = [list: "Methionine", "Phenylalanine", "Tryptophan"]

  proteins(strand) is expected
end

check "Translation stops if STOP codon at beginning of sequence":
  strand = "UAGUGG"
  expected = [list: ]

  proteins(strand) is expected
end

check "Translation stops if STOP codon at end of two-codon sequence":
  strand = "UGGUAG"
  expected = [list: "Tryptophan"]

  proteins(strand) is expected
end

check "Translation stops if STOP codon at end of three-codon sequence":
  strand = "AUGUUUUAA"
  expected = [list: "Methionine", "Phenylalanine"]

  proteins(strand) is expected
end

check "Translation stops if STOP codon in middle of three-codon sequence":
  strand = "UGGUAGUGG"
  expected = [list: "Tryptophan"]

  proteins(strand) is expected
end

check "Translation stops if STOP codon in middle of six-codon sequence":
  strand = "UGGUGUUAUUAAUGGUUU"
  expected = [list: "Tryptophan", "Cysteine", "Tyrosine"]

  proteins(strand) is expected
end

check "Sequence of two non-STOP codons does not translate to a STOP codon":
  strand = "AUGAUG"
  expected = [list: "Methionine", "Methionine"]

  proteins(strand) is expected
end

check "Unknown amino acids, not part of a codon, can't translate":
  strand = "XYZ"

  proteins(strand) raises "Invalid codon"
end

check "Incomplete RNA sequence can't translate":
  strand = "AUGU"

  proteins(strand) raises "Invalid codon"
end

check "Incomplete RNA sequence can translate if valid until a STOP codon":
  strand = "UUCUUCUAAUGGU"
  expected = [list: "Phenylalanine", "Phenylalanine"]

  proteins(strand) is expected
end
