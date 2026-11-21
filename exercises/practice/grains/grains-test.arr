use context starter2024

include file("grains.arr")

check "returns the number of grains on the square -> grains on square 1":
  number = 1
  expected = 1

  on-square(number) is expected
end

check "returns the number of grains on the square -> grains on square 2":
  number = 2
  expected = 2

  on-square(number) is expected
end

check "returns the number of grains on the square -> grains on square 3":
  number = 3
  expected = 4

  on-square(number) is expected
end

check "returns the number of grains on the square -> grains on square 4":
  number = 4
  expected = 8

  on-square(number) is expected
end

check "returns the number of grains on the square -> grains on square 16":
  number = 16
  expected = 32768

  on-square(number) is expected
end

check "returns the number of grains on the square -> grains on square 32":
  number = 32
  expected = 2147483648

  on-square(number) is expected
end

check "returns the number of grains on the square -> grains on square 64":
  number = 64
  expected = 9223372036854775808

  on-square(number) is expected
end

check "returns the number of grains on the square -> square 0 is invalid":
  number = 0

  on-square(number) raises "square must be between 1 and 64"
end

check "returns the number of grains on the square -> negative square is invalid":
  number = -1

  on-square(number) raises "square must be between 1 and 64"
end

check "returns the number of grains on the square -> square greater than 64 is invalid":
  number = 65

  on-square(number) raises "square must be between 1 and 64"
end

check "returns the total number of grains on the board":
  expected = 18446744073709551615

  total() is expected
end
