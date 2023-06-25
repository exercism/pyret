include file("resistor-color.arr")

check "Color codes -> Black":
  color-code("black") is 0
end

check "Color codes -> White":
  color-code("white") is 9
end

check "Color codes -> Orange":
  color-code("orange") is 3
end

check "Colors":
  colors() is [list:
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white",
    ]
end
