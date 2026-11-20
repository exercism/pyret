use context starter2024

include file("isbn-verifier.arr")

check "valid isbn":
  isbn = "3-598-21508-8"
  expected = true

  is-valid(isbn) is expected
end

check "invalid isbn check digit":
  isbn = "3-598-21508-9"
  expected = false

  is-valid(isbn) is expected
end

check "valid isbn with a check digit of 10":
  isbn = "3-598-21507-X"
  expected = true

  is-valid(isbn) is expected
end

check "check digit is a character other than X":
  isbn = "3-598-21507-A"
  expected = false

  is-valid(isbn) is expected
end

check "invalid check digit in isbn is not treated as zero":
  isbn = "4-598-21507-B"
  expected = false

  is-valid(isbn) is expected
end

check "invalid character in isbn is not treated as zero":
  isbn = "3-598-P1581-X"
  expected = false

  is-valid(isbn) is expected
end

check "X is only valid as a check digit":
  isbn = "3-598-2X507-9"
  expected = false

  is-valid(isbn) is expected
end

check "only one check digit is allowed":
  isbn = "3-598-21508-96"
  expected = false

  is-valid(isbn) is expected
end

check "X is not substituted by the value 10":
  isbn = "3-598-2X507-5"
  expected = false

  is-valid(isbn) is expected
end

check "valid isbn without separating dashes":
  isbn = "3598215088"
  expected = true

  is-valid(isbn) is expected
end

check "isbn without separating dashes and X as check digit":
  isbn = "359821507X"
  expected = true

  is-valid(isbn) is expected
end

check "isbn without check digit and dashes":
  isbn = "359821507"
  expected = false

  is-valid(isbn) is expected
end

check "too long isbn and no dashes":
  isbn = "3598215078X"
  expected = false

  is-valid(isbn) is expected
end

check "too short isbn":
  isbn = "00"
  expected = false

  is-valid(isbn) is expected
end

check "isbn without check digit":
  isbn = "3-598-21507"
  expected = false

  is-valid(isbn) is expected
end

check "check digit of X should not be used for 0":
  isbn = "3-598-21515-X"
  expected = false

  is-valid(isbn) is expected
end

check "empty isbn":
  isbn = ""
  expected = false

  is-valid(isbn) is expected
end

check "input is 9 characters":
  isbn = "134456729"
  expected = false

  is-valid(isbn) is expected
end

check "invalid characters are not ignored after checking length":
  isbn = "3132P34035"
  expected = false

  is-valid(isbn) is expected
end

check "invalid characters are not ignored before checking length":
  isbn = "3598P215088"
  expected = false

  is-valid(isbn) is expected
end

check "input is too long but contains a valid isbn":
  isbn = "98245726788"
  expected = false

  is-valid(isbn) is expected
end
