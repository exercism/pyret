provide: to-rna end

include string-dict

COMPLEMENTS = [string-dict:
"C", "G",
"G", "C",
"T", "A",
"A", "U"
]

fun to-rna(dna):
  string-explode(dna).foldl(
    lam(elt, acc):
      acc.push(COMPLEMENTS.get-value(elt))
    end,
    [list: ]
    ).reverse().join-str("")
end