use context starter2024

include file("binary-search-tree.arr")

check "data is retained":
  node-values = [list: 4]
  expected = tree-node(4, empty-tree, empty-tree)

  binary-search-tree(node-values) is expected
end

check "smaller number at left node":
  node-values = [list: 4, 2]
  expected = tree-node(4,
    tree-node(2, empty-tree, empty-tree),
    empty-tree)

  binary-search-tree(node-values) is expected
end

check "same number at left node":
  node-values = [list: 4, 4]
  expected = tree-node(4,
    tree-node(4, empty-tree, empty-tree),
    empty-tree)

  binary-search-tree(node-values) is expected
end

check "greater number at right node":
  node-values = [list: 4, 5]
  expected = tree-node(4,
    empty-tree,
    tree-node(5, empty-tree, empty-tree))

  binary-search-tree(node-values) is expected
end

check "can create complex tree":
  node-values = [list: 4, 2, 6, 1, 3, 5, 7]
  expected = tree-node(4,
    tree-node(2,
      tree-node(1, empty-tree, empty-tree),
      tree-node(3, empty-tree, empty-tree)),
    tree-node(6,
      tree-node(5, empty-tree, empty-tree),
      tree-node(7, empty-tree, empty-tree)))

  binary-search-tree(node-values) is expected
end

check "can sort single number":
  node-values = [list: 2]
  expected = [list: 2]

  tree = binary-search-tree(node-values)
  tree.sorted-data() is expected
end

check "can sort if second number is smaller than first":
  node-values = [list: 2, 1]
  expected = [list: 1, 2]

  tree = binary-search-tree(node-values)
  tree.sorted-data() is expected
end

check "can sort if second number is same as first":
  node-values = [list: 2, 2]
  expected = [list: 2, 2]

  tree = binary-search-tree(node-values)
  tree.sorted-data() is expected
end

check "can sort if second number is greater than first":
  node-values = [list: 2, 3]
  expected = [list: 2, 3]

  tree = binary-search-tree(node-values)
  tree.sorted-data() is expected
end

check "can sort complex tree":
  node-values = [list: 2, 1, 3, 6, 7, 5]
  expected = [list: 1, 2, 3, 5, 6, 7]

  tree = binary-search-tree(node-values)
  tree.sorted-data() is expected
end
