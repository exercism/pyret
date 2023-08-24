use context essentials2020

include file("triangle.arr")

check "equilateral triangle -> all sides are equal":
  equilateral([list: 2, 2, 2]) is true
end

check "equilateral triangle -> any side is unequal":
  equilateral([list: 2, 3, 2]) is-not true
end

check "equilateral triangle -> no sides are equal":
  equilateral([list: 5, 4, 6]) is-not true
end

check "equilateral triangle -> all zero sides is not a triangle":
  equilateral([list: 0, 0, 0]) is-not true
end

check "equilateral triangle -> sides may be floats":
  equilateral([list: 0.5, 0.5, 0.5]) is true
end

check "isosceles triangle -> last two sides are equal":
  isosceles([list: 3, 4, 4]) is true
end

check "isosceles triangle -> first two sides are equal":
  isosceles([list: 4, 4, 3]) is true
end

check "isosceles triangle -> first and last sides are equal":
  isosceles([list: 4, 3, 4]) is true
end

check "isosceles triangle -> equilateral triangles are also isosceles":
  isosceles([list: 4, 4, 4]) is true
end

check "isosceles triangle -> no sides are equal":
  isosceles([list: 2, 3, 4]) is-not true
end

check "isosceles triangle -> first triangle inequality violation":
  isosceles([list: 1, 1, 3]) is-not true
end

check "isosceles triangle -> second triangle inequality violation":
  isosceles([list: 1, 3, 1]) is-not true
end

check "isosceles triangle -> third triangle inequality violation":
  isosceles([list: 3, 1, 1]) is-not true
end

check "isosceles triangle -> sides may be floats":
  isosceles([list: 0.5, 0.4, 0.5]) is true
end

check "scalene triangle -> no sides are equal":
  scalene([list: 5, 4, 6]) is true
end

check "scalene triangle -> all sides are equal":
  scalene([list: 4, 4, 4]) is-not true
end

check "scalene triangle -> first and second sides are equal":
  scalene([list: 4, 4, 3]) is-not true
end

check "scalene triangle -> first and third sides are equal":
  scalene([list: 3, 4, 3]) is-not true
end

check "scalene triangle -> second and third sides are equal":
  scalene([list: 4, 3, 3]) is-not true
end

check "scalene triangle -> may not violate triangle inequality":
  scalene([list: 7, 3, 2]) is-not true
end

check "scalene triangle -> sides may be floats":
  scalene([list: 0.5, 0.4, 0.6]) is true
end
