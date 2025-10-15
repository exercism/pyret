use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide:
  format-message
end

fun format-message(name, position):
    name
    + ", you are the "
    + num-to-string(position)
    + ordinal-suffix-for(position)
    + " customer we serve today. Thank you!"
end

fun ordinal-suffix-for(n):
  mod10 = num-modulo(n, 10)
  mod100 = num-modulo(n, 100)
  if (mod100 == 11) or (mod100 == 12) or (mod100 == 13):
    "th"
  else if mod10 == 1:
    "st"
  else if mod10 == 2:
    "nd"
  else if mod10 == 3:
    "rd"
  else:
    "th"
  end
end