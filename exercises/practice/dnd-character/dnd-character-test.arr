include file("dnd-character.arr")

check "ability modifier -> ability modifier for score 3 is -4":
  randomized-character().roll-stats().modifier(3) is -4
end

check "ability modifier -> ability modifier for score 4 is -3":
  randomized-character().roll-stats().modifier(4) is -3
end

check "ability modifier -> ability modifier for score 5 is -3":
  randomized-character().roll-stats().modifier(5) is -3
end

check "ability modifier -> ability modifier for score 6 is -2":
  randomized-character().roll-stats().modifier(6) is -2
end

check "ability modifier -> ability modifier for score 7 is -2":
  randomized-character().roll-stats().modifier(7) is -2
end

check "ability modifier -> ability modifier for score 8 is -1":
  randomized-character().roll-stats().modifier(8) is -1
end

check "ability modifier -> ability modifier for score 9 is -1":
  randomized-character().roll-stats().modifier(9) is -1
end

check "ability modifier -> ability modifier for score 10 is 0":
  randomized-character().roll-stats().modifier(10) is 0
end

check "ability modifier -> ability modifier for score 11 is 0":
  randomized-character().roll-stats().modifier(11) is 0
end

check "ability modifier -> ability modifier for score 12 is +1":
  randomized-character().roll-stats().modifier(12) is 1
end

check "ability modifier -> ability modifier for score 13 is +1":
  randomized-character().roll-stats().modifier(13) is 1
end

check "ability modifier -> ability modifier for score 14 is +2":
  randomized-character().roll-stats().modifier(14) is 2
end

check "ability modifier -> ability modifier for score 15 is +2":
  randomized-character().roll-stats().modifier(15) is 2
end

check "ability modifier -> ability modifier for score 16 is +3":
  randomized-character().roll-stats().modifier(16) is 3
end

check "ability modifier -> ability modifier for score 17 is +3":
  randomized-character().roll-stats().modifier(17) is 3
end

check "ability modifier -> ability modifier for score 18 is +4":
  randomized-character().roll-stats().modifier(18) is 4
end

check "random ability is within range":
    is-valid = lam(stat): (stat >= 3) and (stat <= 18) end
    stat = randomized-character().ability()
    is-valid(stat) is true
end

check "random character is valid":
  is-valid = lam(stat): (stat >= 3) and (stat <= 18) end
  char = randomized-character().roll-stats()
  is-valid(char.strength) is true
  is-valid(char.dexterity) is true
  is-valid(char.constitution) is true
  is-valid(char.intelligence) is true
  is-valid(char.wisdom) is true
  is-valid(char.charisma) is true
  (char.get-hitpoints() == (10 + char.modifier(char.constitution))) is true
end

check "each ability is only calculated once":
  char = randomized-character().roll-stats()
  (char.strength == char.strength) is true
end
