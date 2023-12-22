use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide-types *

data Character:
  | blank-character() with:
    method randomize-stats(self) -> Character:
      ...
    end
  | character(strength, dexterity, constitution, intelligence, wisdom, charisma) with:
    method get-hitpoints(self) -> NumInteger:
      ...
    end
sharing:
  method ability(self) -> NumInteger:
    ...
  end,
  method modifier(self, value :: NumInteger) -> NumInteger:
    ...
  end
end
