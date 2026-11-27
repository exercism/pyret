use context starter2024

include file("two-fer.arr")

check "no name given":
  name = ""
  expected = "One for you, one for me."

  two-fer(name) is expected
end

check "a name given":
  name = "Alice"
  expected = "One for Alice, one for me."

  two-fer(name) is expected
end

check "another name given":
  name = "Bob"
  expected = "One for Bob, one for me."

  two-fer(name) is expected
end
