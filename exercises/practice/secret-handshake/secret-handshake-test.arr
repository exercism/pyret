include file("secret-handshake.arr")

check "wink for 1":
  commands("00001") is [list: "wink"]
end

check "double blink for 10":
  commands("00010") is [list: "double blink"]
end

check "close your eyes for 100":
  commands("00100") is [list: "close your eyes"]
end

check "jump for 1000":
  commands("01000") is [list: "jump"]
end

check "combine two actions":
  commands("00011") is [list: "wink", "double blink"]
end

check "reverse two actions":
  commands("10011") is [list: "double blink", "wink"]
end

check "reversing one action gives the same action":
  commands("11000") is [list: "jump"]
end

check "reversing no actions still gives no actions":
  commands("10000") is [list: ]
end

check "all possible actions":
  commands("01111") is [list: "wink", "double blink", "close your eyes", "jump"]
end

check "reverse all possible actions":
  commands("11111") is [list: "jump", "close your eyes", "double blink", "wink"]
end

check "do nothing for zero":
  commands("00000") is [list: ]
end
