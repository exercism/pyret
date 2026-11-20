use context starter2024

include file("triangle.arr")

check "equilateral triangle -> all sides are equal":
  sides = [list: 2, 2, 2]
  expected = true

  equilateral(sides) is expected
end

check "equilateral triangle -> any side is unequal":
  sides = [list: 2, 3, 2]
  expected = false

  equilateral(sides) is expected
end

check "equilateral triangle -> no sides are equal":
  sides = [list: 5, 4, 6]
  expected = false

  equilateral(sides) is expected
end

check "equilateral triangle -> all zero sides is not a triangle":
  sides = [list: 0, 0, 0]
  expected = false

  equilateral(sides) is expected
end

check "equilateral triangle -> sides may be floats":
  sides = [list: 0.5, 0.5, 0.5]
  expected = true

  equilateral(sides) is expected
end

check "isosceles triangle -> last two sides are equal":
  sides = [list: 3, 4, 4]
  expected = true

  isosceles(sides) is expected
end

check "isosceles triangle -> first two sides are equal":
  sides = [list: 4, 4, 3]
  expected = true

  isosceles(sides) is expected
end

check "isosceles triangle -> first and last sides are equal":
  sides = [list: 4, 3, 4]
  expected = true

  isosceles(sides) is expected
end

check "isosceles triangle -> equilateral triangles are also isosceles":
  sides = [list: 4, 4, 4]
  expected = true

  isosceles(sides) is expected
end

check "isosceles triangle -> no sides are equal":
  sides = [list: 2, 3, 4]
  expected = false

  isosceles(sides) is expected
end

check "isosceles triangle -> first triangle inequality violation":
  sides = [list: 1, 1, 3]
  expected = false

  isosceles(sides) is expected
end

check "isosceles triangle -> second triangle inequality violation":
  sides = [list: 1, 3, 1]
  expected = false

  isosceles(sides) is expected
end

check "isosceles triangle -> third triangle inequality violation":
  sides = [list: 3, 1, 1]
  expected = false

  isosceles(sides) is expected
end

check "isosceles triangle -> sides may be floats":
  sides = [list: 0.5, 0.4, 0.5]
  expected = true

  isosceles(sides) is expected
end

check "scalene triangle -> no sides are equal":
  sides = [list: 5, 4, 6]
  expected = true

  scalene(sides) is expected
end

check "scalene triangle -> all sides are equal":
  sides = [list: 4, 4, 4]
  expected = false

  scalene(sides) is expected
end

check "scalene triangle -> first and second sides are equal":
  sides = [list: 4, 4, 3]
  expected = false

  scalene(sides) is expected
end

check "scalene triangle -> first and third sides are equal":
  sides = [list: 3, 4, 3]
  expected = false

  scalene(sides) is expected
end

check "scalene triangle -> second and third sides are equal":
  sides = [list: 4, 3, 3]
  expected = false

  scalene(sides) is expected
end

check "scalene triangle -> may not violate triangle inequality":
  sides = [list: 7, 3, 2]
  expected = false

  scalene(sides) is expected
end

check "scalene triangle -> sides may be floats":
  sides = [list: 0.5, 0.4, 0.6]
  expected = true

  scalene(sides) is expected
end
