use context essentials2020

include file("scrabble-score.arr")

check "lowercase letter":
  score("a") is 1
end

check "uppercase letter":
  score("A") is 1
end

check "valuable letter":
  score("f") is 4
end

check "short word":
  score("at") is 2
end

check "short, valuable word":
  score("zoo") is 12
end

check "medium word":
  score("street") is 6
end

check "medium, valuable word":
  score("quirky") is 22
end

check "long, mixed-case word":
  score("OxyphenButazone") is 41
end

check "english-like word":
  score("pinata") is 8
end

check "empty input":
  score("") is 0
end

check "entire alphabet available":
  score("abcdefghijklmnopqrstuvwxyz") is 87
end
