use context starter2024

include file("all-your-base.arr")

check "single bit one to decimal":
  input-base = 2
  digits = [list: 1]
  output-base = 10
  expected = [list: 1]

  rebase(input-base, digits, output-base) is expected
end

check "binary to single decimal":
  input-base = 2
  digits = [list: 1, 0, 1]
  output-base = 10
  expected = [list: 5]

  rebase(input-base, digits, output-base) is expected
end

check "single decimal to binary":
  input-base = 10
  digits = [list: 5]
  output-base = 2
  expected = [list: 1, 0, 1]

  rebase(input-base, digits, output-base) is expected
end

check "binary to multiple decimal":
  input-base = 2
  digits = [list: 1, 0, 1, 0, 1, 0]
  output-base = 10
  expected = [list: 4, 2]

  rebase(input-base, digits, output-base) is expected
end

check "decimal to binary":
  input-base = 10
  digits = [list: 4, 2]
  output-base = 2
  expected = [list: 1, 0, 1, 0, 1, 0]

  rebase(input-base, digits, output-base) is expected
end

check "trinary to hexadecimal":
  input-base = 3
  digits = [list: 1, 1, 2, 0]
  output-base = 16
  expected = [list: 2, 10]

  rebase(input-base, digits, output-base) is expected
end

check "hexadecimal to trinary":
  input-base = 16
  digits = [list: 2, 10]
  output-base = 3
  expected = [list: 1, 1, 2, 0]

  rebase(input-base, digits, output-base) is expected
end

check "15-bit integer":
  input-base = 97
  digits = [list: 3, 46, 60]
  output-base = 73
  expected = [list: 6, 10, 45]

  rebase(input-base, digits, output-base) is expected
end

check "empty list":
  input-base = 2
  digits = [list: ]
  output-base = 10
  expected = [list: 0]

  rebase(input-base, digits, output-base) is expected
end

check "single zero":
  input-base = 10
  digits = [list: 0]
  output-base = 2
  expected = [list: 0]

  rebase(input-base, digits, output-base) is expected
end

check "multiple zeros":
  input-base = 10
  digits = [list: 0, 0, 0]
  output-base = 2
  expected = [list: 0]

  rebase(input-base, digits, output-base) is expected
end

check "leading zeros":
  input-base = 7
  digits = [list: 0, 6, 0]
  output-base = 10
  expected = [list: 4, 2]

  rebase(input-base, digits, output-base) is expected
end

check "input base is one":
  input-base = 1
  digits = [list: 0]
  output-base = 10

  rebase(input-base, digits, output-base) raises "input base must be >= 2"
end

check "input base is zero":
  input-base = 0
  digits = [list: ]
  output-base = 10

  rebase(input-base, digits, output-base) raises "input base must be >= 2"
end

check "input base is negative":
  input-base = -2
  digits = [list: 1]
  output-base = 10

  rebase(input-base, digits, output-base) raises "input base must be >= 2"
end

check "negative digit":
  input-base = 2
  digits = [list: 1, -1, 1, 0, 1, 0]
  output-base = 10

  rebase(input-base, digits, output-base) raises "all digits must satisfy 0 <= d < input base"
end

check "invalid positive digit":
  input-base = 2
  digits = [list: 1, 2, 1, 0, 1, 0]
  output-base = 10

  rebase(input-base, digits, output-base) raises "all digits must satisfy 0 <= d < input base"
end

check "output base is one":
  input-base = 2
  digits = [list: 1, 0, 1, 0, 1, 0]
  output-base = 1

  rebase(input-base, digits, output-base) raises "output base must be >= 2"
end

check "output base is zero":
  input-base = 10
  digits = [list: 7]
  output-base = 0

  rebase(input-base, digits, output-base) raises "output base must be >= 2"
end

check "output base is negative":
  input-base = 2
  digits = [list: 1]
  output-base = -7

  rebase(input-base, digits, output-base) raises "output base must be >= 2"
end

check "both bases are negative":
  input-base = -2
  digits = [list: 1]
  output-base = -7

  rebase(input-base, digits, output-base) raises "input base must be >= 2"
end
