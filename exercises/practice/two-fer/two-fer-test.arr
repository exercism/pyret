include file("two-fer.arr")

check "no name given":
  two-fer("") is "One for you, one for me."
end

check "a name given":
  two-fer("Alice") is "One for Alice, one for me."
end

check "another name given":
  two-fer("Bob") is "One for Bob, one for me."
end
