use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: commands end

import lists as L

fun commands(binary):
  to-commands = lam(index, acc, elt):
    ask:
      | elt == "1" then:
        ask:
          | index == 0 then:
            acc.push("wink")
          | index == 1 then:
            acc.push("double blink")
          | index == 2 then:
            acc.push("close your eyes")
          | index == 3 then:
            acc.push("jump")
          | index == 4 then:
            L.reverse(acc)
        end
      | otherwise:
        acc
    end
  end
  
  digits = L.reverse(string-explode(binary))
  value = L.fold_n(to-commands, 0, [list: ], digits)
  L.reverse(value)
end