use context essentials2020

include file("strain.arr")

#|
  When working offline, all tests except the first one are skipped by default.
  Once you get the first test running, unskip the next one until all tests pass locally.
  Check the block comment below for further details.
|#

fun keep-on-empty-list-returns-empty-list():
  check "keep on empty list returns empty list":
    input = [list: ]
    predicate = lam(elt): true end
    expected = [list: ]

    keep(input, predicate) is expected
  end
end

fun keeps-everything():
  check "keeps everything":
    input = [list: 1, 3, 5]
    predicate = lam(elt): true end
    expected = [list: 1, 3, 5]

    keep(input, predicate) is expected
  end
end

fun keeps-nothing():
  check "keeps nothing":
    input = [list: 1, 3, 5]
    predicate = lam(elt): false end
    expected = [list: ]

    keep(input, predicate) is expected
  end
end

fun keeps-edges():
  check "keeps first and last":
    input = [list: 1, 2, 3]
    predicate = lam(elt): num-modulo(elt, 2) == 1 end
    expected = [list: 1, 3]

    keep(input, predicate) is expected
  end
end

fun keeps-middle():
  check "keeps neither first nor last":
    input = [list: 1, 2, 3]
    predicate = lam(elt): num-modulo(elt, 2) == 0 end
    expected = [list: 2]

    keep(input, predicate) is expected
  end
end

fun keeps-strings():
  check "keeps strings":
    input = [list: "apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
    predicate = lam(elt): string-char-at(elt, 0) ^ string-equal(_, "z") end
    expected = [list: "zebra", "zombies", "zealot"]

    keep(input, predicate) is expected
  end
end

fun keeps-lists():
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
end

fun discard-on-empty-list-returns-empty-list():
  check "discard on empty list returns empty list":
    input = [list: ]
    predicate = lam(elt): true end
    expected = [list: ]

    discard(input, predicate) is expected
  end
end

fun discards-everything():
  check "discards everything":
    input = [list: 1, 3, 5]
    predicate = lam(elt): true end
    expected = [list: ]

    discard(input, predicate) is expected
  end
end

fun discards-nothing():
  check "discards nothing":
    input = [list: 1, 3, 5]
    predicate = lam(elt): false end
    expected = [list: 1, 3, 5]

    discard(input, predicate) is expected
  end
end

fun discards-edges():
  check "discards first and last":
    input = [list: 1, 2, 3]
    predicate = lam(elt): num-modulo(elt, 2) == 1 end
    expected = [list: 2]

    discard(input, predicate) is expected
  end
end

fun discards-middle():
  check "discards neither first nor last":
    input = [list: 1, 2, 3]
    predicate = lam(elt): num-modulo(elt, 2) == 0 end
    expected = [list: 1, 3]

    discard(input, predicate) is expected
  end
end

fun discards-strings():
  check "discards strings":
    input = [list: "apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
    predicate = lam(elt): string-char-at(elt, 0) ^ string-equal(_, "z") end
    expected = [list: "apple", "banana", "cherimoya"]

    discard(input, predicate) is expected
  end
end

fun discards-lists():
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
end



#|
  Code to run each test. Each line corresponds to a test above and whether it should be run.
  To mark a test to be run, replace `false` with `true` on that same line after the comma.
  test(test-a, true) will be run. test(test-a, false) will be skipped.
|#

data TestRun: test(run, active) end

[list: 
  test(keep-on-empty-list-returns-empty-list, true),
  test(keeps-everything, false),
  test(keeps-nothing, false),
  test(keeps-edges, false),
  test(keeps-middle, false),
  test(keeps-strings, false),
  test(keeps-lists, false),
  test(discard-on-empty-list-returns-empty-list, false),
  test(discards-everything, false),
  test(discards-nothing, false),
  test(discards-edges, false),
  test(discards-middle, false),
  test(discards-strings, false),
  test(discards-lists, false)
].each(lam(t): when t.active: t.run() end end)
