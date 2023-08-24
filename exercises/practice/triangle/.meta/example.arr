use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: equilateral, isosceles, scalene end

import lists as L
import sets as S

fun equilateral(sides):
  valid = is_triangle(sides)
  ask:
    | valid == true then: S.list-to-list-set(sides).size() == 1
    | otherwise: false
  end
end

fun isosceles(sides):
  valid = is_triangle(sides)
  ask:
    | valid == true then: S.list-to-list-set(sides).size() <= 2
    | otherwise: false
  end
end

fun scalene(sides):
  valid = is_triangle(sides)
  ask:
    | valid == true then: S.list-to-list-set(sides).size() == 3
    | otherwise: false
  end
end

fun is_triangle(sides):
  sorted = sides.sort()
  a = sorted.get(0)
  b = sorted.get(1)
  c = sorted.get(2)
  ((a + b) > c) and L.all(lam(side): not(num-equal(side, 0)) end, sides)
end
