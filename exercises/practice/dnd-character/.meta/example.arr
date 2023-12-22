use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide-types *

data Character:
  | blank-character() with:
    method randomize-stats(self) -> Character:
      strength = self.ability()
      dexterity = self.ability()
      constitution = self.ability()
      intelligence = self.ability()
      wisdom = self.ability()
      charisma = self.ability()
      character(strength, dexterity, constitution, intelligence, wisdom, charisma)
    end
  | character(strength, dexterity, constitution, intelligence, wisdom, charisma) with:
    method get-hitpoints(self) -> NumInteger:
      10 + self.modifier(self.constitution)
    end
sharing:
  method ability(self) -> NumInteger:
    roll-dice = lam(_): num-random(6) + 1 end
    rolls = map(roll-dice, repeat(4, 0))
    rolls.sort().drop(1).foldl(lam(elt, acc): elt + acc end, 0)
  end,
  method modifier(self, value :: NumInteger) -> NumInteger:
    modified = (value - 10) / 2
    num-floor(modified)
  end
end
