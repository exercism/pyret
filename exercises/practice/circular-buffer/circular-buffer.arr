use context starter2024

provide-types *
provide: make-buffer end

data CircularBuffer:
  | buffer()
    with:
    method write(self, value):
      ...
    end,
    method read(self):
      ...
    end,
    method overwrite(self, value):
      ...
    end,
    method clear(self):
      ...
    end
end

fun make-buffer(capacity :: Number) -> CircularBuffer:
  ...
end
