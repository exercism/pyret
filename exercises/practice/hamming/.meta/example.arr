use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: distance end

import lists as L

fun distance(first-strand, second-strand):
  ask:
    | string-length(first-strand) <> string-length(second-strand) then:
      raise("Strands must be of equal length.")
    | (first-strand == "") and (second-strand <> "") then:
      raise("Strands must be of equal length.")
    | (first-strand <> "") and (second-strand == "") then:
      raise("Strands must be of equal length.")
    | otherwise:
      L.fold2(
        lam(acc, elt1, elt2):
          ask:
            | elt1 <> elt2 then:
              acc + 1
            | otherwise:
              acc
          end
        end,
        0,
        string-explode(first-strand),
        string-explode(second-strand))
  end
end