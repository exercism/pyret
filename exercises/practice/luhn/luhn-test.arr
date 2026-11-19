use context starter2024

include file("luhn.arr")

check "single digit strings can not be valid":
  value = "1"
  expected = false

  is-valid(value) is expected
end

check "a single zero is invalid":
  value = "0"
  expected = false

  is-valid(value) is expected
end

check "a simple valid SIN that remains valid if reversed":
  value = "059"
  expected = true

  is-valid(value) is expected
end

check "a simple valid SIN that becomes invalid if reversed":
  value = "59"
  expected = true

  is-valid(value) is expected
end

check "a valid Canadian SIN":
  value = "055 444 285"
  expected = true

  is-valid(value) is expected
end

check "invalid Canadian SIN":
  value = "055 444 286"
  expected = false

  is-valid(value) is expected
end

check "invalid credit card":
  value = "8273 1232 7352 0569"
  expected = false

  is-valid(value) is expected
end

check "invalid long number with an even remainder":
  value = "1 2345 6789 1234 5678 9012"
  expected = false

  is-valid(value) is expected
end

check "invalid long number with a remainder divisible by 5":
  value = "1 2345 6789 1234 5678 9013"
  expected = false

  is-valid(value) is expected
end

check "valid number with an even number of digits":
  value = "095 245 88"
  expected = true

  is-valid(value) is expected
end

check "valid number with an odd number of spaces":
  value = "234 567 891 234"
  expected = true

  is-valid(value) is expected
end

check "valid strings with a non-digit added at the end become invalid":
  value = "059a"
  expected = false

  is-valid(value) is expected
end

check "valid strings with punctuation included become invalid":
  value = "055-444-285"
  expected = false

  is-valid(value) is expected
end

check "valid strings with symbols included become invalid":
  value = "055# 444$ 285"
  expected = false

  is-valid(value) is expected
end

check "single zero with space is invalid":
  value = " 0"
  expected = false

  is-valid(value) is expected
end

check "more than a single zero is valid":
  value = "0000 0"
  expected = true

  is-valid(value) is expected
end

check "input digit 9 is correctly converted to output digit 9":
  value = "091"
  expected = true

  is-valid(value) is expected
end

check "very long input is valid":
  value = "9999999999 9999999999 9999999999 9999999999"
  expected = true

  is-valid(value) is expected
end

check "valid luhn with an odd number of digits and non zero first digit":
  value = "109"
  expected = true

  is-valid(value) is expected
end

check "using ascii value for non-doubled non-digit isn't allowed":
  value = "055b 444 285"
  expected = false

  is-valid(value) is expected
end

check "using ascii value for doubled non-digit isn't allowed":
  value = ":9"
  expected = false

  is-valid(value) is expected
end

check "non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed":
  value = "59%59"
  expected = false

  is-valid(value) is expected
end
