provide: word-count end

include string-dict

fun word-count(phrase):
  remove-trailing-quote = lam(fragment):
    last-index = string-length(fragment) - 1
    if string-char-at(fragment, last-index) == "'":
      string-substring(fragment, 0, last-index)
    else:
      fragment
    end
  end
  
  remove-leading-quote = lam(fragment):
    last-index = string-length(fragment)
    if string-char-at(fragment, 0) == "'":
      string-substring(fragment, 1, last-index)
    else:
      fragment
    end
  end
  
  remove-surrounding-quotes = lam(fragment):
    fragment
      ^ remove-trailing-quote
      ^ remove-leading-quote
  end
  
  phrase
    ^ string-replace(_, ",", " ")
    ^ string-replace(_, "\n", " ")
    ^ string-replace(_, ": ", " ")
    ^ string-replace(_, " '", " ")
    ^ string-replace(_, "' ", " ")
    ^ string-to-lower
    ^ string-split-all(_, " ")
    ^ _.foldl(
    lam(elt, acc):
      if elt == "":
        acc
      else:
        cleaned = elt
          ^ string-to-code-points
          ^ _.filter(
          lam(cp):
            # a-z or 0-9 or '
            ((cp >= 97) and (cp <= 122)) or ((cp >= 48) and (cp <= 57)) or (cp == 39)
          end)
          ^ string-from-code-points
          ^ remove-surrounding-quotes
        
        value = acc.get(cleaned).or-else(0) + 1
        acc.set(cleaned, value)
      end
  end,
  [string-dict: ])
end