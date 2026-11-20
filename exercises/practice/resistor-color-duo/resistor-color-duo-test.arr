use context starter2024

include file("resistor-color-duo.arr")

check "Brown and black":
  colors = [list: "brown", "black"]
  expected = 10

  color-code(colors) is expected
end

check "Blue and grey":
  colors = [list: "blue", "grey"]
  expected = 68

  color-code(colors) is expected
end

check "Yellow and violet":
  colors = [list: "yellow", "violet"]
  expected = 47

  color-code(colors) is expected
end

check "White and red":
  colors = [list: "white", "red"]
  expected = 92

  color-code(colors) is expected
end

check "Orange and orange":
  colors = [list: "orange", "orange"]
  expected = 33

  color-code(colors) is expected
end

check "Ignore additional colors":
  colors = [list: "green", "brown", "orange"]
  expected = 51

  color-code(colors) is expected
end

check "Black and brown, one-digit":
  colors = [list: "black", "brown"]
  expected = 1

  color-code(colors) is expected
end
