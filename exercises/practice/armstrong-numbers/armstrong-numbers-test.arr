use context starter2024

include file("armstrong-numbers.arr")

check "Zero is an Armstrong number":
  number = 0
  expected = true

  is-armstrong-number(number) is expected
end

check "Single-digit numbers are Armstrong numbers":
  number = 5
  expected = true

  is-armstrong-number(number) is expected
end

check "There are no two-digit Armstrong numbers":
  number = 10
  expected = false

  is-armstrong-number(number) is expected
end

check "Three-digit number that is an Armstrong number":
  number = 153
  expected = true

  is-armstrong-number(number) is expected
end

check "Three-digit number that is not an Armstrong number":
  number = 100
  expected = false

  is-armstrong-number(number) is expected
end

check "Four-digit number that is an Armstrong number":
  number = 9474
  expected = true

  is-armstrong-number(number) is expected
end

check "Four-digit number that is not an Armstrong number":
  number = 9475
  expected = false

  is-armstrong-number(number) is expected
end

check "Seven-digit number that is an Armstrong number":
  number = 9926315
  expected = true

  is-armstrong-number(number) is expected
end

check "Seven-digit number that is not an Armstrong number":
  number = 9926314
  expected = false

  is-armstrong-number(number) is expected
end

check "Armstrong number containing seven zeroes":
  number = 186709961001538790100634132976990
  expected = true

  is-armstrong-number(number) is expected
end

check "The largest and last Armstrong number":
  number = 115132219018763992565095597973971522401
  expected = true

  is-armstrong-number(number) is expected
end
