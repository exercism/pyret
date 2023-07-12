provide: two-fer end

fun two-fer(name):
  ask:
  | name == "" then: "One for you, one for me."
  | otherwise: "One for " + name + ", one for me."
end
