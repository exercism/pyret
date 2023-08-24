use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: response end

import lists as L
import either as EI

fun response(hey-bob):
  trimmed = [list: "\n", "\t", " ", "\r"].foldl(
    lam(elt, acc):
      string-replace(acc, elt, "")
    end, hey-bob)
  
  is-shouting = lam():
    uppercase = string-explode("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    lowercase = string-explode("abcdefghijklmnopqrstuvwxyz")

    index-of = lam(item, l):
      find-item = lam(acc, elt):
        ask:
          | elt == item then:
            EI.right(acc)
          | otherwise:
            EI.left(acc + 1)
        end
      end
      L.fold-while(find-item, 0, l)
    end

    only-the-letters = string-explode(trimmed).filter(lam(c):
        in-case = lam(l): index-of(c, l) <> l.length() end
         
        in-case(uppercase) or in-case(lowercase)
      end).join-str("")
    
    if only-the-letters == "":
      false
    else:
      only-the-letters == string-to-upper(only-the-letters)
    end
  end
  
  is-silence = lam(): trimmed == "" end
  
  is-question = lam(): 
    last-index = ask:
      | trimmed <> "" then: string-length(trimmed) - 1
      | otherwise: 0
    end

    string-char-at(trimmed, last-index) == "?"
  end
  
  ask:
    | is-silence() then: "Fine. Be that way!"
    | is-shouting() and is-question() then: "Calm down, I know what I'm doing!"
    | is-shouting() then: 'Whoa, chill out!'
    | is-question() then: "Sure."
    | otherwise: "Whatever."
  end
end