include file("simple-linked-list.arr")

# No canonical data available for this exercise so these have been ported from Python and F#

check "empty list has length zero":
  empty-list.length() is 0
end

check "singleton list has length one":
  linked-list(1, empty-list).length() is 1
end

check "non-empty list has correct length":
  result = empty-list
    ^ linked-list(3, _)
    ^ linked-list(2, _)
    ^ linked-list(1, _)

  result.length() is 3
end

check "singleton list has head":
  linked-list(1, empty-list).head is 1
end

check "non-empty list has correct head":
  result = empty-list
    ^ linked-list(1, _)
    ^ linked-list(2, _)

  result.head is 2
end

check "can push to non-empty list":
  result = empty-list
    ^ linked-list(3, _)
    ^ linked-list(2, _)
    ^ linked-list(1, _)
  
  result.push(4).length() is 4
end

check "pushing to empty list changes head":
  result = empty-list.push(5)
  
  result.length() is 1
  result.head is 5
end

check "can access second element in list":
  result = empty-list
    ^ linked-list(3, _)
    ^ linked-list(4, _)
    ^ linked-list(5, _)

  result.tail.head is 4
end

check "test singleton list head has no tail":
  linked-list(1, empty-list).tail is empty-list
end

check "non-empty list traverse":
  my-list = range(0, 11).foldl(
    lam(elt, acc):
     acc.push(elt)
    end,
    empty-list)
  
  traversed = range(-10, 0).foldl(
    lam(n, acc) block:
      acc.head is num-abs(n)
      acc.tail
    end,
    my-list)

  traversed.tail is empty-list
end

check "empty linked list to list is empty":
  empty-list.to-list() is [list: ]
end

check "singleton linked list to list with single element":
  linked-list(1, empty-list).to-list() is [list: 1]
end

check "non-empty linked list to list is list with all elements":
  result = empty-list
    ^ linked-list(3, _)
    ^ linked-list(2, _)
    ^ linked-list(1, _)

    result.to-list() is [list: 3, 2, 1]
end

check "reversed empty list is empty list":
  empty-list.reversed().to-list() is [list: ]
end

check "reversed singleton list is same list":
  linked-list(1, empty-list).reversed() is linked-list(1, empty-list)
end

check "reverse non-empty list":
  result = empty-list
    ^ linked-list(3, _)
    ^ linked-list(2, _)
    ^ linked-list(1, _)

  result.reversed().to-list() is [list: 1, 2, 3]
end
