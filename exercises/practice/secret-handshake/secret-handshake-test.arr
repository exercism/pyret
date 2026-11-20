use context starter2024

include file("secret-handshake.arr")

check "wink for 1":
  number = "00001"
  expected = [list: "wink"]

  commands(number) is expected
end

check "double blink for 10":
  number = "00010"
  expected = [list: "double blink"]

  commands(number) is expected
end

check "close your eyes for 100":
  number = "00100"
  expected = [list: "close your eyes"]

  commands(number) is expected
end

check "jump for 1000":
  number = "01000"
  expected = [list: "jump"]

  commands(number) is expected
end

check "combine two actions":
  number = "00011"
  expected = [list: "wink", "double blink"]

  commands(number) is expected
end

check "reverse two actions":
  number = "10011"
  expected = [list: "double blink", "wink"]

  commands(number) is expected
end

check "reversing one action gives the same action":
  number = "11000"
  expected = [list: "jump"]

  commands(number) is expected
end

check "reversing no actions still gives no actions":
  number = "10000"
  expected = [list: ]

  commands(number) is expected
end

check "all possible actions":
  number = "01111"
  expected = [list: "wink", "double blink", "close your eyes", "jump"]

  commands(number) is expected
end

check "reverse all possible actions":
  number = "11111"
  expected = [list: "jump", "close your eyes", "double blink", "wink"]

  commands(number) is expected
end

check "do nothing for zero":
  number = "00000"
  expected = [list: ]

  commands(number) is expected
end
