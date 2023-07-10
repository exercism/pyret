include file("difference-of-squares.arr")

check "Square the sum of the numbers up to the given number -> square of sum 1":
  square-of-sum(1) is 1
end

check "Square the sum of the numbers up to the given number -> square of sum 5":
  square-of-sum(5) is 225
end

check "Square the sum of the numbers up to the given number -> square of sum 100":
  square-of-sum(100) is 25502500
end

check "Sum the squares of the numbers up to the given number -> sum of squares 1":
  sum-of-squares(1) is 1
end

check "Sum the squares of the numbers up to the given number -> sum of squares 5":
  sum-of-squares(5) is 55
end

check "Sum the squares of the numbers up to the given number -> sum of squares 100":
  sum-of-squares(100) is 338350
end

check "Subtract sum of squares from square of sums -> difference of squares 1":
  difference-of-squares(1) is 0
end

check "Subtract sum of squares from square of sums -> difference of squares 5":
  difference-of-squares(5) is 170
end

check "Subtract sum of squares from square of sums -> difference of squares 100":
  difference-of-squares(100) is 25164150
end
