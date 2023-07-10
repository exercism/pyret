include file("series.arr")

check "slices of one from one":
  slices("1", 1) is [list: "1"]
end

check "slices of one from two":
  slices("12", 1) is [list: "1", "2"]
end

check "slices of two":
  slices("35", 2) is [list: "35"]
end

check "slices of two overlap":
  slices("9142", 2) is [list: "91", "14", "42"]
end

check "slices can include duplicates":
  slices("777777", 3) is [list: "777", "777", "777", "777"]
end

check "slices of a long series":
  slices("918493904243", 5) is [list: "91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243"]
end

check "slice length is too large":
  slices("12345", 6) raises "slice length cannot be greater than series length"
end

check "slice length is way too large":
  slices("12345", 42) raises "slice length cannot be greater than series length"
end

check "slice length cannot be zero":
  slices("12345", 0) raises "slice length cannot be zero"
end

check "slice length cannot be negative":
  slices("12345", -1) raises "slice length cannot be negative"
end

check "empty series is invalid":
  slices("", 1) raises "series cannot be empty"
end