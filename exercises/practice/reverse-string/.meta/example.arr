use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: reversed end

fun reversed(input):
  string-explode(input).reverse().join-str("")
end