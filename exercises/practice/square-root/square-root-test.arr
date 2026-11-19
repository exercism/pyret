use context starter2024

include file("square-root.arr")

check "root of 1":
  radicand = 1
  expected = 1

  square-root(radicand) is expected
end

check "root of 4":
  radicand = 4
  expected = 2

  square-root(radicand) is expected
end

check "root of 25":
  radicand = 25
  expected = 5

  square-root(radicand) is expected
end

check "root of 81":
  radicand = 81
  expected = 9

  square-root(radicand) is expected
end

check "root of 196":
  radicand = 196
  expected = 14

  square-root(radicand) is expected
end

check "root of 65025":
  radicand = 65025
  expected = 255

  square-root(radicand) is expected
end
