use context essentials2020

include file("resistor-color-trio.arr")

check "Orange and orange and black":
  colors = [list: "orange", "orange", "black"]
  expected = "33 ohms"

  label(colors) is expected
end

check "Blue and grey and brown":
  colors = [list: "blue", "grey", "brown"]
  expected = "680 ohms"

  label(colors) is expected
end

check "Red and black and red":
  colors = [list: "red", "black", "red"]
  expected = "2 kiloohms"

  label(colors) is expected
end

check "Green and brown and orange":
  colors = [list: "green", "brown", "orange"]
  expected = "51 kiloohms"

  label(colors) is expected
end

check "Yellow and violet and yellow":
  colors = [list: "yellow", "violet", "yellow"]
  expected = "470 kiloohms"

  label(colors) is expected
end

check "Blue and violet and blue":
  colors = [list: "blue", "violet", "blue"]
  expected = "67 megaohms"

  label(colors) is expected
end

check "Minimum possible value":
  colors = [list: "black", "black", "black"]
  expected = "0 ohms"

  label(colors) is expected
end

check "Maximum possible value":
  colors = [list: "white", "white", "white"]
  expected = "99 gigaohms"

  label(colors) is expected
end

check "First two colors make an invalid octal number":
  colors = [list: "black", "grey", "black"]
  expected = "8 ohms"

  label(colors) is expected
end

check "Ignore extra colors":
  colors = [list: "blue", "green", "yellow", "orange"]
  expected = "650 kiloohms"

  label(colors) is expected
end
