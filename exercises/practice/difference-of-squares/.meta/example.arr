use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: square-of-sum, sum-of-squares, difference-of-squares end

fun square-of-sum(number):
  sum = (number * (number + 1)) / 2
  sum * sum
end

fun sum-of-squares(number):
  (number * (number + 1) * ((2 * number) + 1)) / 6
end

fun difference-of-squares(number):
  square-of-sum(number) - sum-of-squares(number)
end