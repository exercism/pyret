provide: nucleotide-counts end

include string-dict

fun nucleotide-counts(strand):
  string-explode(strand).foldl(lam(elt, acc):
      ask:
        | acc.has-key-now(elt) then:
          _ = cases(Option) acc.get-now(elt):
            | some(a) => acc.set-now(elt, a + 1)
          end
          
          acc
        | otherwise:
          raise("Invalid nucleotide in strand")
      end
    end, [mutable-string-dict: "A", 0, "C", 0, "G", 0, "T", 0])
end