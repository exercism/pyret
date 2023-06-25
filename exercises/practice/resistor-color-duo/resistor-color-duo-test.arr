include file("resistor-color-duo.arr")

check "Brown and black":
  color-code([list: "brown", "black"]) is 10
end

check "Blue and grey":
  color-code([list: "blue", "grey"]) is 68
end

check "Yellow and violet":
  color-code([list: "yellow", "violet"]) is 47
end

check "White and red":
  color-code([list: "white", "red"]) is 92
end

check  "Orange and orange":
  color-code([list: "orange", "orange"]) is 33
end

check "Ignore additional colors":
  color-code([list: "green", "brown", "orange"]) is 51
end

check "Black and brown, one-digit":
  color-code([list: "black", "brown"]) is 1
end
