use context starter2024

include file("etl.arr")

include string-dict

check "single letter":
  input = [string-dict: "1", [list: "A"]]
  expected = [string-dict:
             "a", "1"]
  my-translate(input) is expected
end

check "single score with multiple letters":
  input = [string-dict: "1", [list: "A", "E", "I", "O", "U"]]
  expected = [string-dict:
             "a", "1",
             "e", "1",
             "i", "1",
             "o", "1",
             "u", "1"]
  my-translate(input) is expected
end

check "multiple scores with multiple letters":
  input = [string-dict: "1", [list: "A", "E"], "2", [list: "D", "G"]]
  expected = [string-dict:
             "a", "1",
             "d", "2",
             "e", "1",
             "g", "2"]
  my-translate(input) is expected
end

check "multiple scores with differing numbers of letters":
  input = [string-dict: "1", [list: "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], "2", [list: "D", "G"], "3", [list: "B", "C", "M", "P"], "4", [list: "F", "H", "V", "W", "Y"], "5", [list: "K"], "8", [list: "J", "X"], "10", [list: "Q", "Z"]]
  expected = [string-dict:
             "a", "1",
             "b", "3",
             "c", "3",
             "d", "2",
             "e", "1",
             "f", "4",
             "g", "2",
             "h", "4",
             "i", "1",
             "j", "8",
             "k", "5",
             "l", "1",
             "m", "3",
             "n", "1",
             "o", "1",
             "p", "3",
             "q", "10",
             "r", "1",
             "s", "1",
             "t", "1",
             "u", "1",
             "v", "4",
             "w", "4",
             "x", "8",
             "y", "4",
             "z", "10"]
  my-translate(input) is expected
end
