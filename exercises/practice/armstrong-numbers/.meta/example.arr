provide: is-armstrong-number end

import lists as L

fun is-armstrong-number(number):
  digits = string-explode(num-to-string(number))
  sum = L.foldl(
    lam(acc, elt):
      cases(Option) string-to-number(elt):
        | some(digit) => acc + num-expt(digit,  digits.length())
        | none => raise("unable to convert character to digit")
      end
    end,
    0,
    digits)

  sum == number
end
