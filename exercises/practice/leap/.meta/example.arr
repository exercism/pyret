use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: leap end

fun leap(year):
  fun year-is-divisible-by(divisor):
    num-equal(num-modulo(year, divisor), 0)
  end

  year-is-divisible-by(4) and (not(year-is-divisible-by(100)) or year-is-divisible-by(400))
end
