use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: is-valid end

import lists as L

fun is-valid(card-number):
  to-lower-bound = lam(n, b): if n > b: n - b else: n end end
    
  card-digits = string-replace(card-number, " ", "")
  len = string-length(card-digits)
  ask:
    | len > 1 then:
      cases (Option) string-to-number(card-digits):
        | none => false
        | some(digits) =>
          step = num-modulo(len, 2)
          checksum = L.fold_n(
            lam(index, acc, elt):
              cases (Option) string-to-number(elt):
                | none => acc
                | some(digit) =>
                  ask:
                    | num-modulo(index, 2) == step then:
                      acc + (to-lower-bound(digit * 2, 9))
                    | otherwise:
                      acc + digit
                  end
              end
            end,
            0,
            0,
            string-explode(card-digits))
          num-modulo(checksum, 10) == 0
      end
    | otherwise:
      false
  end
end