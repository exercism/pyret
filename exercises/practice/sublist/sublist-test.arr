use context starter2024

include file("sublist.arr")

check "empty lists":
  list-one = [list: ]
  list-two = [list: ]
  expected = "equal"

  sublist(list-one, list-two) is expected
end

check "empty list within non empty list":
  list-one = [list: ]
  list-two = [list: 1, 2, 3]
  expected = "sublist"

  sublist(list-one, list-two) is expected
end

check "non empty list contains empty list":
  list-one = [list: 1, 2, 3]
  list-two = [list: ]
  expected = "superlist"

  sublist(list-one, list-two) is expected
end

check "list equals itself":
  list-one = [list: 1, 2, 3]
  list-two = [list: 1, 2, 3]
  expected = "equal"

  sublist(list-one, list-two) is expected
end

check "different lists":
  list-one = [list: 1, 2, 3]
  list-two = [list: 2, 3, 4]
  expected = "unequal"

  sublist(list-one, list-two) is expected
end

check "false start":
  list-one = [list: 1, 2, 5]
  list-two = [list: 0, 1, 2, 3, 1, 2, 5, 6]
  expected = "sublist"

  sublist(list-one, list-two) is expected
end

check "consecutive":
  list-one = [list: 1, 1, 2]
  list-two = [list: 0, 1, 1, 1, 2, 1, 2]
  expected = "sublist"

  sublist(list-one, list-two) is expected
end

check "sublist at start":
  list-one = [list: 0, 1, 2]
  list-two = [list: 0, 1, 2, 3, 4, 5]
  expected = "sublist"

  sublist(list-one, list-two) is expected
end

check "sublist in middle":
  list-one = [list: 2, 3, 4]
  list-two = [list: 0, 1, 2, 3, 4, 5]
  expected = "sublist"

  sublist(list-one, list-two) is expected
end

check "sublist at end":
  list-one = [list: 3, 4, 5]
  list-two = [list: 0, 1, 2, 3, 4, 5]
  expected = "sublist"

  sublist(list-one, list-two) is expected
end

check "at start of superlist":
  list-one = [list: 0, 1, 2, 3, 4, 5]
  list-two = [list: 0, 1, 2]
  expected = "superlist"

  sublist(list-one, list-two) is expected
end

check "in middle of superlist":
  list-one = [list: 0, 1, 2, 3, 4, 5]
  list-two = [list: 2, 3]
  expected = "superlist"

  sublist(list-one, list-two) is expected
end

check "at end of superlist":
  list-one = [list: 0, 1, 2, 3, 4, 5]
  list-two = [list: 3, 4, 5]
  expected = "superlist"

  sublist(list-one, list-two) is expected
end

check "first list missing element from second list":
  list-one = [list: 1, 3]
  list-two = [list: 1, 2, 3]
  expected = "unequal"

  sublist(list-one, list-two) is expected
end

check "second list missing element from first list":
  list-one = [list: 1, 2, 3]
  list-two = [list: 1, 3]
  expected = "unequal"

  sublist(list-one, list-two) is expected
end

check "first list missing additional digits from second list":
  list-one = [list: 1, 2]
  list-two = [list: 1, 22]
  expected = "unequal"

  sublist(list-one, list-two) is expected
end

check "order matters to a list":
  list-one = [list: 1, 2, 3]
  list-two = [list: 3, 2, 1]
  expected = "unequal"

  sublist(list-one, list-two) is expected
end

check "same digits but different numbers":
  list-one = [list: 1, 0, 1]
  list-two = [list: 10, 1]
  expected = "unequal"

  sublist(list-one, list-two) is expected
end
