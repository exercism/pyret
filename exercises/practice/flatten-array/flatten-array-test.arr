include file("flatten-array.arr")

check "empty":
  input = [list: ]

  expected = [list: ]

  flatten(input) is expected
end

check "no nesting":
  input = [list: 0, 1, 2]

  expected = [list: 0, 1, 2]

  flatten(input) is expected
end

check "flattens a nested array":
  input = [list: [list: ]]

  expected = [list: ]

  flatten(input) is expected
end

check "flattens array with just integers present":
  input = [list: 1, [list: 2, 3, 4, 5, 6, 7], 8]

  expected = [list: 1, 2, 3, 4, 5, 6, 7, 8]

  flatten(input) is expected
end

check "5 level nesting":
  input = [list:
    0,
    2,
    [list:
      [list: 2, 3],
      8,
      100,
      4,
      [list:
        [list:
          [list: 50]]]],
    -2]

  expected = [list:
    0,
    2,
    2,
    3,
    8,
    100,
    4,
    50,
    -2]

  flatten(input) is expected
end

check "6 level nesting":
  input = [list:
    1,
    [list:
      2,
      [list: [list: 3]],
      [list:
      4,
      [list: [list: 5]]],
      6,
      7],
    8]

  expected = [list:
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8]

  flatten(input) is expected
end

check "null values are omitted from the final result":
  input = [list: 1, 2, nothing]

  expected = [list: 1, 2]

  flatten(input) is expected
end

check "consecutive null values at the front of the list are omitted from the final result":
  input = [list: nothing, nothing, 3]

  expected = [list: 3]

  flatten(input) is expected
end

check "consecutive null values in the middle of the list are omitted from the final result":
  input = [list: 1, nothing, nothing, 4]

  expected = [list: 1, 4]

  flatten(input) is expected
end

check "6 level nest list with null values":
  input = [list:
    0,
    2,
    [list:
      [list: 2, 3],
      8,
      [list: [list: 100 ]],
      nothing,
      [list: [list: nothing]]],
    -2]

  expected = [list:
    0,
    2,
    2,
    3,
    8,
    100,
    -2]

  flatten(input) is expected
end

check "all values in nested list are null":
  input = [list:
    nothing,
    [list:
      [list:
        [list: nothing]]],
    nothing,
    nothing,
    [list:
      [list:
        nothing,
        nothing],
      nothing],
    nothing]

  expected = [list: ]

  flatten(input) is expected
end
