use context starter2024

include file("darts.arr")

check "Missed target":
  x = -9
  y = 9
  expected = 0

  score(x, y) is expected
end

check "On the outer circle":
  x = 0
  y = 10
  expected = 1

  score(x, y) is expected
end

check "On the middle circle":
  x = -5
  y = 0
  expected = 5

  score(x, y) is expected
end

check "On the inner circle":
  x = 0
  y = -1
  expected = 10

  score(x, y) is expected
end

check "Exactly on center":
  x = 0
  y = 0
  expected = 10

  score(x, y) is expected
end

check "Near the center":
  x = -0.1
  y = -0.1
  expected = 10

  score(x, y) is expected
end

check "Just within the inner circle":
  x = 0.7
  y = 0.7
  expected = 10

  score(x, y) is expected
end

check "Just outside the inner circle":
  x = 0.8
  y = -0.8
  expected = 5

  score(x, y) is expected
end

check "Just within the middle circle":
  x = -3.5
  y = 3.5
  expected = 5

  score(x, y) is expected
end

check "Just outside the middle circle":
  x = -3.6
  y = -3.6
  expected = 1

  score(x, y) is expected
end

check "Just within the outer circle":
  x = -7.0
  y = 7.0
  expected = 1

  score(x, y) is expected
end

check "Just outside the outer circle":
  x = 7.1
  y = -7.1
  expected = 0

  score(x, y) is expected
end

check "Asymmetric position between the inner and middle circles":
  x = 0.5
  y = -4
  expected = 5

  score(x, y) is expected
end
