use context essentials2020

include file("list-ops.arr")

check "append entries to a list and return the new list -> empty lists":
  list1 = [list: ]
  list2 = [list: ]
  expected = [list: ]
  
  my-append(list1, list2) is expected
end

check "append entries to a list and return the new list -> list to empty list":
  list1 = [list: ]
  list2 = [list: 1, 2, 3, 4]
  expected = [list: 1, 2, 3, 4]

  my-append(list1, list2) is expected
end

check "append entries to a list and return the new list -> empty list to list":
  list1 = [list: 1, 2, 3, 4]
  list2 = [list: ]
  expected = [list: 1, 2, 3, 4]

  my-append(list1, list2) is expected
end

check "append entries to a list and return the new list -> non-empty lists":
  list1 = [list: 1, 2]
  list2 = [list: 3, 4, 5]
  expected = [list: 1, 2, 3, 4, 5]

  my-append(list1, list2) is expected
end

check "concatenate a list of lists -> empty list":
  input = [list: ]
  expected = [list: ]

  my-concatenate(input) is expected
end

check "concatenate a list of lists -> list of lists":
  input = [list: [list: 1, 2], [list: 3], [list: ], [list: 4, 5, 6]]
  expected = [list: 1, 2, 3, 4, 5, 6]

  my-concatenate(input) is expected
end

check "concatenate a list of lists -> list of nested lists":
  input = [list: 
    [list: [list: 1], [list: 2]],
    [list: [list: 3]],
    [list: [list: ]],
    [list: [list: 4, 5, 6]]]
  expected = [list: 
    [list: 1],
    [list: 2],
    [list: 3],
    [list:],
    [list: 4, 5, 6]]

  my-concatenate(input) is expected
end

check "filter list returning only values that satisfy the filter function -> empty list":
  input = [list: ]
  f = lam(x): num-modulo(x, 2) == 1 end
  expected = [list: ]

  my-filter(input, f) is expected
end

check "filter list returning only values that satisfy the filter function -> non-empty list":
  input = [list: 1, 2, 3, 5]
  f = lam(x): num-modulo(x, 2) == 1 end
  expected = [list: 1, 3, 5]

  my-filter(input, f) is expected
end

check "returns the length of a list -> empty list":
  input = [list: ]
  expected = 0

  my-length(input) is expected
end

check "returns the length of a list -> non-empty list":
  input = [list: 1, 2, 3, 4]
  expected = 4
  my-length(input) is expected
end

check "return a list of elements whose values equal the list value transformed by the mapping function -> empty list":
  input = [list: ]
  f = lam(x): x + 1 end
  expected = [list: ]

  my-map(input, f) is expected
end

check "return a list of elements whose values equal the list value transformed by the mapping function -> non-empty list":
  input = [list: 1, 3, 5, 7]
  f = lam(x): x + 1 end
  expected = [list: 2, 4, 6, 8]

  my-map(input, f) is expected
end

check "folds (reduces) the given list from the left with a function -> empty list":
  input = [list: ]
  f = lam(elt, acc): elt * acc end
  initial = 2
  expected = 2

  my-foldl(input, f, initial) is expected
end

check "folds (reduces) the given list from the left with a function -> direction independent function applied to non-empty list":
  input = [list: 1, 2, 3, 4]
  f = lam(elt, acc): elt + acc end
  initial = 5
  expected = 15

  my-foldl(input, f, initial) is expected
end

check "folds (reduces) the given list from the left with a function -> direction dependent function applied to non-empty list":
  input = [list: 1, 2, 3, 4]
  f = lam(elt, acc): acc / elt end
  initial = 24
  expected = 64

  my-foldl(input, f, initial) is expected
end

check "folds (reduces) the given list from the right with a function -> empty list":
  input = [list: ]
  f = lam(elt, acc): elt * acc end
  initial = 2
  expected = 2

  my-foldr(input, f, initial) is expected
end

check "folds (reduces) the given list from the right with a function -> direction independent function applied to non-empty list":
  input = [list: 1, 2, 3, 4]
  f = lam(elt, acc): elt + acc end
  initial = 5
  expected = 15

  my-foldr(input, f, initial) is expected
end

check "folds (reduces) the given list from the right with a function -> direction dependent function applied to non-empty list":
  input = [list: 1, 2, 3, 4]
  f = lam(elt, acc): elt / acc end
  initial = 24
  expected = 9

  my-foldr(input, f, initial) is expected
end

check "reverse the elements of the list -> empty list":
  input = [list: ]
  expected = [list: ]
  
  my-reverse(input) is expected
end

check "reverse the elements of the list -> non-empty list":
  input = [list: 1, 3, 5, 7]
  expected = [list: 7, 5, 3, 1]
  
  my-reverse(input) is expected
end

check "reverse the elements of the list -> list of lists is not flattened":
  input = [list: 
    [list: 1, 2],
    [list: 3],
    [list: ], 
    [list: 4, 5, 6]]
  expected = [list:
    [list: 4, 5, 6],
    [list: ],
    [list: 3],
    [list: 1, 2]]

  my-reverse(input) is expected
end