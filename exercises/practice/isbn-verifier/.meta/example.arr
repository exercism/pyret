use context starter2024

provide: is-valid end

import lists as L

fun is-valid(isbn):
  chars = string-explode(string-replace(isbn, "-", ""))

  ask:
    | chars.length() <> 10 then: false
    | not(has-only-valid-chars(chars)) then: false
    | otherwise: num-modulo(weighted-sum-of(chars), 11) == 0
  end
end

fun has-only-valid-chars(chars):
  parts = split-at(9, chars)
  L.all(string-is-number, parts.prefix) and is-valid-check(parts.suffix.get(0))
end

fun is-valid-check(char):
  string-is-number(char) or (char == "X")
end

fun weighted-sum-of(chars):
  L.fold_n(
    lam(index, sum, char):
      sum + (value-of(char) * (10 - index))
    end,
    0,
    0,
    chars)
end

fun value-of(char):
  if char == "X":
    10
  else:
    string-to-code-point(char) - string-to-code-point("0")
  end
end
