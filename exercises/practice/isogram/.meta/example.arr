provide: is-isogram end

import sets as S

fun is-isogram(phrase):
  lowered = string-to-lower(phrase)
  chars = string-to-code-points(lowered).filter(lam(c): (c >= 61) and (c <= 122) end)
  chars.length() == S.list-to-list-set(chars).size()
end
