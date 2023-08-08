provide: clean end

is-alpha = lam(char :: String) -> Boolean:
  cp = string-to-code-point(string-to-lower(char))
  (cp >= 97) and (cp <= 122)
end

is-numeric = lam(char :: String) -> Boolean:
  cp = string-to-code-point(string-to-lower(char))
  (cp >= 48) and (cp <= 57)
end

WHITELIST = [list: " ", "+", "(", ")", ".", "-"]

fun clean(phone-number):
  digits = string-explode(phone-number).foldl(
    lam(elt, acc):
      ask:
        | WHITELIST.member(elt) then:
          acc
        | is-alpha(elt) then:
          raise("letters not permitted")
        | not(is-numeric(elt)) then:
          raise("punctuations not permitted")
        | otherwise:
          acc.push(elt)
      end
    end,
    [list: ]
  ).reverse()
  
  ask:
    | digits.length() < 10 then:
      raise("must not be fewer than 10 digits")
    | digits.length() > 11 then:
      raise("must not be greater than 11 digits")
    | (digits.length() == 11) and (digits.get(0) <> "1") then:
      raise("11 digits must start with 1")
    | otherwise:
      truncated =
        if digits.length() == 10: 
          digits
        else:
          digits.drop(1)
        end
      
      area-code-start = truncated.get(0)
      exchange-code-start = truncated.get(3)
      ask:
        | area-code-start == "0" then:
          raise("area code cannot start with zero")
        | area-code-start == "1" then:
          raise("area code cannot start with one")
        | exchange-code-start == "0" then:
          raise("exchange code cannot start with zero")
        | exchange-code-start == "1" then:
          raise("exchange code cannot start with one")
        | otherwise:
          truncated.join-str("")
      end
  end
end
