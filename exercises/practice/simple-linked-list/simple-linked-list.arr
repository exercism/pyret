provide-types *

#|
  We have given you a beginning structure to help pass the tests here. 
|#
data LinkedList:
  | empty-list
  | linked-list(head, tail)
sharing:
  method length(self):
    raise("please implement the length method")
  end,
  method push(self, val):
    raise("please implement the push method")
  end,
  method reversed(self):
    raise("please implement the reversed method")
  end,
  method to-list(self):
    raise("please implement the to-list method")
  end
end