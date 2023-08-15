include file("strain.arr")

check "keep on empty list returns empty list":
  input = [list: ]
  predicate = lam(elt): true end
  expected = [list: ]

  keep(input, predicate) is expected
end

check "keeps everything":
  input = [list: 1, 3, 5]
  predicate = lam(elt): true end
  expected = [list: 1, 3, 5]

  keep(input, predicate) is expected
end

check "keeps nothing":
  input = [list: 1, 3, 5]
  predicate = lam(elt): false end
  expected = [list: ]

  keep(input, predicate) is expected
end

check "keeps first and last":
  input = [list: 1, 2, 3]
  predicate = lam(elt): num-modulo(elt, 2) == 1 end
  expected = [list: 1, 3]

  keep(input, predicate) is expected
end

check "keeps neither first nor last":
  input = [list: 1, 2, 3]
  predicate = lam(elt): num-modulo(elt, 2) == 0 end
  expected = [list: 2]

  keep(input, predicate) is expected
end

check "keeps strings":
  input = [list: "apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
  predicate = lam(elt): string-char-at(elt, 0) ^ string-equal(_, "z") end
  expected = [list: "zebra", "zombies", "zealot"]

  keep(input, predicate) is expected
end

check "keeps lists":
  input = [list: 
    [list: 1, 2, 3],
    [list: 5, 5, 5],
    [list: 5, 1, 2],
    [list: 2, 1, 2],
    [list: 1, 5, 2],
    [list: 2, 2, 1],
    [list: 1, 2, 5]]

  predicate = lam(elt): elt.member(5) end

  expected = [list: 
    [list: 5, 5, 5],
    [list: 5, 1, 2],
    [list: 1, 5, 2],
    [list: 1, 2, 5]]

  keep(input, predicate) is expected
end

check "discard on empty list returns empty list":
  input = [list: ]
  predicate = lam(elt): true end
  expected = [list: ]

  discard(input, predicate) is expected
end

check "discards everything":
  input = [list: 1, 3, 5]
  predicate = lam(elt): true end
  expected = [list: ]

  discard(input, predicate) is expected
end

check "discards nothing":
  input = [list: 1, 3, 5]
  predicate = lam(elt): false end
  expected = [list: 1, 3, 5]

  discard(input, predicate) is expected
end

check "discards first and last":
  input = [list: 1, 2, 3]
  predicate = lam(elt): num-modulo(elt, 2) == 1 end
  expected = [list: 2]

  discard(input, predicate) is expected
end

check "discards neither first nor last":
  input = [list: 1, 2, 3]
  predicate = lam(elt): num-modulo(elt, 2) == 0 end
  expected = [list: 1, 3]

  discard(input, predicate) is expected
end

check "discards strings":
  input = [list: "apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
  predicate = lam(elt): string-char-at(elt, 0) ^ string-equal(_, "z") end
  expected = [list: "apple", "banana", "cherimoya"]

  discard(input, predicate) is expected
end

check "discards lists":
  input = [list:
    [list: 1, 2, 3],
    [list: 5, 5, 5],
    [list: 5, 1, 2],
    [list: 2, 1, 2],
    [list: 1, 5, 2],
    [list: 2, 2, 1],
    [list: 1, 2, 5]]

  predicate = lam(elt): elt.member(5) end

  expected = [list:
    [list: 1, 2, 3],
    [list: 2, 1, 2],
    [list: 2, 2, 1]]

  discard(input, predicate) is expected
end
