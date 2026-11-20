use context starter2024

include file("rotational-cipher.arr")

check "rotate a by 0, same output as input":
  plaintext = "a"
  shift-key = 0
  expected = "a"

  my-rotate(plaintext, shift-key) is expected
end

check "rotate a by 1":
  plaintext = "a"
  shift-key = 1
  expected = "b"

  my-rotate(plaintext, shift-key) is expected
end

check "rotate a by 26, same output as input":
  plaintext = "a"
  shift-key = 26
  expected = "a"

  my-rotate(plaintext, shift-key) is expected
end

check "rotate m by 13":
  plaintext = "m"
  shift-key = 13
  expected = "z"

  my-rotate(plaintext, shift-key) is expected
end

check "rotate n by 13 with wrap around alphabet":
  plaintext = "n"
  shift-key = 13
  expected = "a"

  my-rotate(plaintext, shift-key) is expected
end

check "rotate capital letters":
  plaintext = "OMG"
  shift-key = 5
  expected = "TRL"

  my-rotate(plaintext, shift-key) is expected
end

check "rotate spaces":
  plaintext = "O M G"
  shift-key = 5
  expected = "T R L"

  my-rotate(plaintext, shift-key) is expected
end

check "rotate numbers":
  plaintext = "Testing 1 2 3 testing"
  shift-key = 4
  expected = "Xiwxmrk 1 2 3 xiwxmrk"

  my-rotate(plaintext, shift-key) is expected
end

check "rotate punctuation":
  plaintext = "Let's eat, Grandma!"
  shift-key = 21
  expected = "Gzo'n zvo, Bmviyhv!"

  my-rotate(plaintext, shift-key) is expected
end

check "rotate all letters":
  plaintext = "The quick brown fox jumps over the lazy dog."
  shift-key = 13
  expected = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."

  my-rotate(plaintext, shift-key) is expected
end
