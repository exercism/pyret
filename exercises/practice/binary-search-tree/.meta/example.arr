use context starter2024

provide-types *

provide: binary-search-tree end

data BinarySearchTree:
  | empty-tree with:
    method insert(_, new-value):
      tree-node(new-value, empty-tree, empty-tree)
    end,
    method sorted-data(_):
      [list: ]
    end
  | tree-node(value, left, right) with:
    method insert(self, new-value):
      if new-value <= self.value:
        tree-node(self.value, self.left.insert(new-value), self.right)
      else:
        tree-node(self.value, self.left, self.right.insert(new-value))
      end
    end,
    method sorted-data(self):
      self.left.sorted-data() + [list: self.value] + self.right.sorted-data()
    end
end

fun binary-search-tree(values):
  values.foldl(lam(value, tree): tree.insert(value) end, empty-tree)
end
