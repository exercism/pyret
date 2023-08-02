provide: is-pangram end

import lists as L
import sets as S

LOWERCASE = string-explode("abcdefghijklmnopqrstuvwxyz")

fun is-pangram(phrase):
  letters = S.list-to-set(string-explode(string-tolower(phrase)))
  L.all(
    lam(char): letters.member(char) end,
    LOWERCASE)
end