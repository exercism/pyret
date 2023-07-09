include file("grains.arr")

check "returns the number of grains on the square -> grains on square 1":
  on-square(1) is 1
end

check "returns the number of grains on the square -> grains on square 2":
  on-square(2) is 2
end

check "returns the number of grains on the square -> grains on square 3":
  on-square(3) is 4
end

check "returns the number of grains on the square -> grains on square 4":
  on-square(4) is 8
end

check "returns the number of grains on the square -> grains on square 16":
  on-square(16) is 32768
end

check "returns the number of grains on the square -> grains on square 32":
  on-square(32) is 2147483648
end

check "returns the number of grains on the square -> grains on square 64":
  on-square(64) is 9223372036854775808
end

check "returns the number of grains on the square -> square 0 raises an exception":
  on-square(0) raises "square must be between 1 and 64"
end

check "returns the number of grains on the square -> negative square raises an exception":
  on-square(-1) raises "square must be between 1 and 64"
end

check "returns the number of grains on the square -> square greater than 64 raises an exception":
  on-square(65) raises "square must be between 1 and 64"
end

check "returns the total number of grains on the board":
  total() is 18446744073709551615
end