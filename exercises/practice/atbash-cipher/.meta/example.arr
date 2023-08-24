use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: encode, decode end

include string-dict

TRANSCRIBE-PAIRS = fold2(
  lam(acc, elt1, elt2):
    key = string-from-code-point(elt1)
    value = string-from-code-point(elt2)
    acc.set(key, value)
  end,
  [string-dict: ],
  range(97, 123),
  range(97, 123).reverse()
)

fun chunk-a-list(lst, n):
  ask:
    | lst.length() <= n then:
      [list: lst]
    | otherwise:
      [list: lst.take(n)] + chunk-a-list(lst.drop(n), n)
  end
end

fun transcribe(phrase):
  string-explode(
    string-to-lower(phrase)).filter(
    lam(char):
      code-point = string-to-code-point(char)
      ask:
        | (48 <= code-point) and (code-point <= 57) then:
          true 
        | (97 <= code-point) and (code-point <= 122) then:
          true
        | otherwise:
          false 
      end
    end).map(
    lam(char):
      cases(Option) TRANSCRIBE-PAIRS.get(char):
        | some(a) => a
        | none => char
      end
    end).join-str("")
end

fun encode(phrase):
  encrypted = transcribe(phrase)
  chunk-a-list(
    string-explode(encrypted), 5).map(
    lam(l): l.join-str("") end
    ).join-str(" ")
end

fun decode(phrase):
  transcribe(phrase)
end
