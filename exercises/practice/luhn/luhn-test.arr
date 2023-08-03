include file("luhn.arr")

check "single digit strings can not be valid":
  is-valid("1") is-not true
end

check "a single zero is invalid":
  is-valid("0") is-not true
end

check "a simple valid SIN that remains valid if reversed":
  is-valid("059") is true
end

check "a simple valid SIN that becomes invalid if reversed":
  is-valid("59") is true
end

check "a valid Canadian SIN":
  is-valid("055 444 285") is true
end

check "invalid Canadian SIN":
  is-valid("055 444 286") is-not true
end

check "invalid credit card":
  is-valid("8273 1232 7352 0569") is-not true
end

check "invalid long number with an even remainder":
  is-valid("1 2345 6789 1234 5678 9012") is-not true
end

check "invalid long number with a remainder divisible by 5":
  is-valid("1 2345 6789 1234 5678 9013") is-not true
end

check "valid number with an even number of digits":
  is-valid("095 245 88") is true
end

check "valid number with an odd number of spaces":
  is-valid("234 567 891 234") is true
end

check "valid strings with a non-digit added at the end become invalid":
  is-valid("059a") is-not true
end

check "valid strings with punctuation included become invalid":
  is-valid("055-444-285") is-not true
end

check "valid strings with symbols included become invalid":
  is-valid("055# 444$ 285") is-not true
end

check "single zero with space is invalid":
  is-valid(" 0") is-not true
end

check "more than a single zero is valid":
  is-valid("0000 0") is true
end

check "input digit 9 is correctly converted to output digit 9":
  is-valid("091") is true
end

check "very long input is valid":
  is-valid("9999999999 9999999999 9999999999 9999999999") is true
end

check "valid luhn with an odd number of digits and non zero first digit":
  is-valid("109") is true
end

check "using ascii value for non-doubled non-digit isn't allowed":
  is-valid("055b 444 285") is-not true
end

check "using ascii value for doubled non-digit isn't allowed":
  is-valid(":9") is-not true
end

check "non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed":
  is-valid("59%59") is-not true
end
