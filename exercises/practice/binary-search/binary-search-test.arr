use context starter2024

include file("binary-search.arr")

check "finds a value in an array with one element":
  input = [list: 6]
  value = 6
  expected = 0
  binary-search(input, value) is expected
end

check "finds a value in the middle of an array":
  input = [list: 1, 3, 4, 6, 8, 9, 11]
  value = 6
  expected = 3
  binary-search(input, value) is expected
end

check "finds a value at the beginning of an array":
  input = [list: 1, 3, 4, 6, 8, 9, 11]
  value = 1
  expected = 0
  binary-search(input, value) is expected
end

check "finds a value at the end of an array":
  input = [list: 1, 3, 4, 6, 8, 9, 11]
  value = 11
  expected = 6
  binary-search(input, value) is expected
end

check "finds a value in an array of odd length":
  input = [list: 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634]
  value = 144
  expected = 9
  binary-search(input, value) is expected
end

check "finds a value in an array of even length":
  input = [list: 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]
  value = 21
  expected = 5
  binary-search(input, value) is expected
end

check "identifies that a value is not included in the array":
  input = [list: 1, 3, 4, 6, 8, 9, 11]
  value = 7
  binary-search(input, value) raises "value not in list"
end

check "a value smaller than the array's smallest value is not found":
  input = [list: 1, 3, 4, 6, 8, 9, 11]
  value = 0
  binary-search(input, value) raises "value not in list"
end

check "a value larger than the array's largest value is not found":
  input = [list: 1, 3, 4, 6, 8, 9, 11]
  value = 13
  binary-search(input, value) raises "value not in list"
end

check "nothing is found in an empty array":
  input = [list: ]
  value = 1
  binary-search(input, value) raises "value not in list"
end

check "nothing is found when the left and right bounds cross":
  input = [list: 1, 2]
  value = 0
  binary-search(input, value) raises "value not in list"
end
