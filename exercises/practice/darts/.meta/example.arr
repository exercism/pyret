use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: score end

fun score(x, y):
  hypotenuse = num-sqrt(num-expt(x, 2) + num-expt(y, 2))

  if hypotenuse <= 1:
    10
  else if hypotenuse <= 5:
    5
  else if hypotenuse <= 10:
    1
  else:
    0
  end
end
