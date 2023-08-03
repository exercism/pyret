provide-types *

# Replace the ... with your code to pass the tests. Good luck!

data Clock:
  | clock(hours, minutes)
sharing:
  method add(self, minutes) -> Clock:
    ...
  end,
  method subtract(self, minutes) -> Clock:
    ...
  end,
  method normalize(self) -> Clock:
    ...
  end,
  method values-equal(self, other) -> Boolean:
    ...
  end,
  method to-string(self) -> String:
    ...
  end
end
