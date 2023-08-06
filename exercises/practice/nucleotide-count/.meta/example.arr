provide: nucleotide-counts end

include string-dict

fun nucleotide-counts(strand):
  string-explode(strand).foldl(lam(elt, acc):
      ask:
        | not(acc.has-key(elt)) then:
          raise("Invalid nucleotide in strand")
        | otherwise:
          count = acc.get-value(elt)
          acc.set(elt, count + 1)
      end
    end, [string-dict: "A", 0, "C", 0, "G", 0, "T", 0])
end