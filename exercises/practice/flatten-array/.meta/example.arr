use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: flatten end

import lists as L

fun flatten(lst):
  lst.foldr(lam(elt, acc):
      ask:
        | elt == nothing then:
          acc
        | is-empty(elt) then:
          acc
        | is-link(elt) then:
          result = flatten(elt)
          result.append(acc)
        | otherwise:
          L.push(acc, elt)
      end
    end,
    [list: ])
end
