include file("protein-translation.arr")

check "Empty RNA sequence results in no proteins":
  proteins("") is [list: ]
end

check "Methionine RNA sequence":
  proteins("AUG") is [list: "Methionine"]
end

check "Phenylalanine RNA sequence 1":
  proteins("UUU") is [list: "Phenylalanine"]
end

check "Phenylalanine RNA sequence 2":
  proteins("UUC") is [list: "Phenylalanine"]
end

check "Leucine RNA sequence 1":
  proteins("UUA") is [list: "Leucine"]
end

check "Leucine RNA sequence 2":
  proteins("UUG") is [list: "Leucine"]
end

check "Serine RNA sequence 1":
  proteins("UCU") is [list: "Serine"]
end

check "Serine RNA sequence 2":
  proteins("UCC") is [list: "Serine"]
end

check "Serine RNA sequence 3":
  proteins("UCA") is [list: "Serine"]
end

check "Serine RNA sequence 4":
  proteins("UCG") is [list: "Serine"]
end

check "Tyrosine RNA sequence 1":
  proteins("UAU") is [list: "Tyrosine"]
end

check "Tyrosine RNA sequence 2":
  proteins("UAC") is [list: "Tyrosine"]
end

check "Cysteine RNA sequence 1":
  proteins("UGU") is [list: "Cysteine"]
end

check "Cysteine RNA sequence 2":
  proteins("UGC") is [list: "Cysteine"]
end

check "Tryptophan RNA sequence":
  proteins("UGG") is [list: "Tryptophan"]
end

check "STOP codon RNA sequence 1":
  proteins("UAA") is [list: ]
end

check "STOP codon RNA sequence 2":
  proteins("UAG") is [list: ]
end

check "STOP codon RNA sequence 3":
  proteins("UGA") is [list: ]
end

check "Sequence of two protein codons translates into proteins":
  proteins("UUUUUU") is [list: "Phenylalanine", "Phenylalanine"]
end

check "Sequence of two different protein codons translates into proteins":
  proteins("UUAUUG") is [list: "Leucine", "Leucine"]
end

check "Translate RNA strand into correct protein list":
  proteins("AUGUUUUGG") is [list: "Methionine", "Phenylalanine", "Tryptophan"]
end

check "Translation stops if STOP codon at beginning of sequence":
  proteins("UAGUGG") is [list: ]
end

check "Translation stops if STOP codon at end of two-codon sequence":
  proteins("UGGUAG") is [list: "Tryptophan"]
end

check "Translation stops if STOP codon at end of three-codon sequence":
  proteins("AUGUUUUAA") is [list: "Methionine", "Phenylalanine"]
end

check "Translation stops if STOP codon in middle of three-codon sequence":
  proteins("UGGUAGUGG") is [list: "Tryptophan"]
end

check "Translation stops if STOP codon in middle of six-codon sequence":
  proteins("UGGUGUUAUUAAUGGUUU") is [list: "Tryptophan", "Cysteine", "Tyrosine"]
end

check "Non-existing codon can't translate":
  proteins("AAA") raises "Invalid codon"
end

check "Unknown amino acids, not part of a codon, can't translate":
  proteins("XYZ") raises "Invalid codon"
end

check "Incomplete RNA sequence can't translate":
  proteins("AUGU") raises "Invalid codon"
end

check "Incomplete RNA sequence can translate if valid until a STOP codon":
  proteins("UUCUUCUAAUGGU") is [list: "Phenylalanine", "Phenylalanine"]
end
