use context starter2024

include file("series.arr")

check "slices of one from one":
  series = "1"
  slice-length = 1
  expected = [list: "1"]

  slices(series, slice-length) is expected
end

check "slices of one from two":
  series = "12"
  slice-length = 1
  expected = [list: "1", "2"]

  slices(series, slice-length) is expected
end

check "slices of two":
  series = "35"
  slice-length = 2
  expected = [list: "35"]

  slices(series, slice-length) is expected
end

check "slices of two overlap":
  series = "9142"
  slice-length = 2
  expected = [list: "91", "14", "42"]

  slices(series, slice-length) is expected
end

check "slices can include duplicates":
  series = "777777"
  slice-length = 3
  expected = [list: "777", "777", "777", "777"]

  slices(series, slice-length) is expected
end

check "slices of a long series":
  series = "918493904243"
  slice-length = 5
  expected = [list: "91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243"]

  slices(series, slice-length) is expected
end

check "slice length is too large":
  series = "12345"
  slice-length = 6

  slices(series, slice-length) raises "slice length cannot be greater than series length"
end

check "slice length is way too large":
  series = "12345"
  slice-length = 42

  slices(series, slice-length) raises "slice length cannot be greater than series length"
end

check "slice length cannot be zero":
  series = "12345"
  slice-length = 0

  slices(series, slice-length) raises "slice length cannot be zero"
end

check "slice length cannot be negative":
  series = "123"
  slice-length = -1

  slices(series, slice-length) raises "slice length cannot be negative"
end

check "empty series is invalid":
  series = ""
  slice-length = 1

  slices(series, slice-length) raises "series cannot be empty"
end
