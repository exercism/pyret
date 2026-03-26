use context starter2024

include file("dnd-character.arr")

# declaring some variables to be more concise inside the tests.
modifier = blank-character().modifier 
ability = blank-character().ability
randomize-stats = blank-character().randomize-stats

check "ability modifier -> ability modifier for score 3 is -4":
  modifier(3) is -4
end

check "ability modifier -> ability modifier for score 4 is -3":
  modifier(4) is -3
end

check "ability modifier -> ability modifier for score 5 is -3":
  modifier(5) is -3
end

check "ability modifier -> ability modifier for score 6 is -2":
  modifier(6) is -2
end

check "ability modifier -> ability modifier for score 7 is -2":
  modifier(7) is -2
end

check "ability modifier -> ability modifier for score 8 is -1":
  modifier(8) is -1
end

check "ability modifier -> ability modifier for score 9 is -1":
  modifier(9) is -1
end

check "ability modifier -> ability modifier for score 10 is 0":
  modifier(10) is 0
end

check "ability modifier -> ability modifier for score 11 is 0":
  modifier(11) is 0
end

check "ability modifier -> ability modifier for score 12 is +1":
  modifier(12) is 1
end

check "ability modifier -> ability modifier for score 13 is +1":
  modifier(13) is 1
end

check "ability modifier -> ability modifier for score 14 is +2":
  modifier(14) is 2
end

check "ability modifier -> ability modifier for score 15 is +2":
  modifier(15) is 2
end

check "ability modifier -> ability modifier for score 16 is +3":
  modifier(16) is 3
end

check "ability modifier -> ability modifier for score 17 is +3":
  modifier(17) is 3
end

check "ability modifier -> ability modifier for score 18 is +4":
  modifier(18) is 4
end

check "random ability is within range":
    stat = ability()

    is-valid = lam(n): (n >= 3) and (n <= 18) end

    is-valid(stat) is true
end

check "random character is valid":
  new-character = randomize-stats()

  is-valid = lam(n): (n >= 3) and (n <= 18) end

  is-valid(new-character.strength) is true
  is-valid(new-character.dexterity) is true
  is-valid(new-character.constitution) is true
  is-valid(new-character.intelligence) is true
  is-valid(new-character.wisdom) is true
  is-valid(new-character.charisma) is true

  expected = 10 + new-character.modifier(new-character.constitution)
  new-character.get-hitpoints() is expected
end
