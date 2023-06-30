provide-types *

data Character:
  | randomized-character() with:
    method roll-stats(self) -> Character:
      abilities = self.ability()
      strength = self.ability()
      dexterity = self.ability()
      constitution = self.ability()
      intelligence = self.ability()
      wisdom = self.ability()
      charisma = self.ability()
      character(strength, dexterity, constitution, intelligence, wisdom, charisma)
    end
  | character(strength, dexterity, constitution, intelligence, wisdom, charisma) with:
    method get-hitpoints(self):
      10 + self.modifier(self.constitution)
    end,
    method modifier(self, value :: NumInteger) -> NumInteger:
      modified = (value - 10) / 2
      num-floor(modified)
    end
sharing:
    method ability(self) -> NumInteger:
      roll-dice = lam(_): num-random(5) + 1 end
      rolls = map(roll-dice, repeat(4, 0))
      rolls.sort().drop(1).foldl(lam(elt, acc): elt + acc end, 0)
    end
end
