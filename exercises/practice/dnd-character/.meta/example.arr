provide: character, modifier, ability end

modifier = lam(value): num-floor((value - 10) / 2) end
ability = lam():
    roll-dice = lam(_): num-random(5) + 1 end
    rolls = map(roll-dice, repeat(4, 0))
    rolls.sort().drop(1).foldl(lam(elt, acc): elt + acc end, 0)
end

character = lam():
  constitution = ability()
  {
    strength: ability(),
    dexterity: ability(),
    constitution: constitution,
    intelligence: ability(),
    wisdom: ability(),
    charisma: ability(),
    hitpoints: modifier(constitution)
  }
end
