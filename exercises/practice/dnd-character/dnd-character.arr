provide-types *

data Character:
  | randomized-character() with:
    method roll-stats(self) -> Character:
      ...
    end
  | character() with:
    method get-hitpoints(self):
      ...
    end,
    method modifier(self, value):
      ...
    end
  sharing:
  method ability(self):
    ...
  end
end
