use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: steps end

fun steps(n):
  if n > 0:
    steps-recurse(n, 0)
  else:
    raise("Only positive numbers are allowed")
  end
end

fun is-even(num):
  num-modulo(num, 2) == 0
end

fun steps-recurse(current, acc):
  ask:
    | current == 1 then: acc
    | is-even(current) then: steps-recurse(current / 2, acc + 1)
    | otherwise: steps-recurse((3 * current) + 1, acc + 1)
  end
end
