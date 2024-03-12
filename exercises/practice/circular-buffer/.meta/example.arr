use context essentials2020 # Don't delete this line when using Pyret on Exercism 

data CircularBuffer:
  | buffer(capacity :: Number, size :: Number, elements, read-index :: Number, write-index :: Number)
    with:
    method write(self, value :: Number) block:
      when self.size == self.capacity:
        raise(“full buffer”)
      end
      self.elements.set-now(self.write-index, value)
      buffer(self.capacity,
        self.size + 1,
        self.elements,
        self.read-index,
        num-modulo(self.read-index + 1, self.capacity))
    end,
    method read(self) block:
      when self.size == 0:
        raise(“empty buffer”)
      end
      val = self.elements.get-now(self.read-index)
      updated = buffer(self.capacity,
        self.size - 1,
        self.elements,
        num-modulo(self.read-index + 1, self.capacity),
        self.write-index)
    {val;updated}
    end,
    method overwrite(self, value :: Number) block:
      buff = if self.size == self.capacity:
        self.read().{1}
      else:
        self
      end
      buff.write(value)
    end,
    method clear(self):
      make-buffer(self.capacity)
    end
end
fun make-buffer(capacity :: Number):
    buffer(capacity, 0, array-of(none, capacity), 0, 0)
end