use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide-types *

data LinkedList:
  | empty-list with:
    method foldl(_, _, acc): acc end,
  | linked-list(head, tail) with:
    method foldl(self, f, acc):
      self.tail.foldl(f, f(self.head, acc))
    end,
    method get-head(self):
      self.head
    end,
    method get-tail(self):
      self.tail
    end
sharing:
  method length(self):
    cases(LinkedList) self:
      | empty-list => 0
      | linked-list(_, r) => 
        r.foldl(lam(elt, acc): acc + 1 end, 1)
    end
  end,
  method push(self, val): linked-list(val, self) end,
  method reversed(self):
    self.foldl(
      lam(elt, acc): linked-list(elt, acc) end,
      empty-list)
  end,
  method to-list(self):
    self.foldl(
      lam(elt, acc): acc.push(elt) end,
      [list: ])
  end
end