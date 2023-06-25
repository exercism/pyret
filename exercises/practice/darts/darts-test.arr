include file("darts.arr")

check "Missed target":
  score(-9, 9) is 0
end

check "On the outer circle":
  score(0, 10) is 1
end

check "On the middle circle":
  score(-5, 0) is 5
end

check "On the inner circle":
  score(0, -1) is 10
end

check "Exactly on center":
  score(0, 0) is 10
end

check "Near the center":
  score(-0.1, -0.1) is 10
end

check "Just within the inner circle":
  score(0.7, 0.7) is 10
end

check "Just outside the inner circle":
  score(0.8, -0.8) is 5
end

check "Just within the middle circle":
  score(-3.5, 3.5) is 5
end

check "Just outside the middle circle":
  score(-3.6, 3.6) is 1
end

check "Just within the outer circle":
  score(-7.0, 7.0) is 1
end

check "Just outside the outer circle":
  score(7.1, -7.1) is 0
end

check "Asymmetric position between the inner and middle circles":
  score(0.5, -4) is 5
end
