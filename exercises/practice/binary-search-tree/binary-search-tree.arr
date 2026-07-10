use context starter2024

provide-types *

provide: binary-search-tree end

data BinarySearchTree:
  | empty-tree with:
    method insert(_, new-value):
      raise("please implement the insert method")
    end,
    method sorted-data(_):
      raise("please implement the sorted-data method")
    end
  | tree-node(value, left, right) with:
    method insert(_, new-value):
      raise("please implement the insert method")
    end,
    method sorted-data(_):
      raise("please implement the sorted-data method")
    end
end

fun binary-search-tree(values):
  raise("please implement the binary-search-tree function")
end
