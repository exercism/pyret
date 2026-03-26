use context starter2024

include file("robot-simulator.arr")

check "Create robot at origin facing north":
  r = robot(0, 0, 'north')
  expected = robot(0, 0, 'north')
  r is expected
end

check "Create robot at negative position facing south":
  r = robot(-1, -1, 'south')
  expected = robot(-1, -1, 'south')
  r is expected
end

check "Rotating clockwise changes north to east":
  r = robot(0, 0, 'north')
  expected = robot(0, 0, 'east')
  r.move('R') is expected
end

check "Rotating clockwise changes east to south":
  r = robot(0, 0, 'east')
  expected = robot(0, 0, 'south')
  r.move('R') is expected
end

check "Rotating clockwise changes south to west":
  r = robot(0, 0, 'south')
  expected = robot(0, 0, 'west')
  r.move('R') is expected
end

check "Rotating clockwise changes west to north":
  r = robot(0, 0, 'west')
  expected = robot(0, 0, 'north')
  r.move('R') is expected
end

check "Rotating counter-clockwise changes north to west":
  r = robot(0, 0, 'north')
  expected = robot(0, 0, 'west')
  r.move('L') is expected
end

check "Rotating counter-clockwise changes west to south":
  r = robot(0, 0, 'west')
  expected = robot(0, 0, 'south')
  r.move('L') is expected
end

check "Rotating counter-clockwise changes south to east":
  r = robot(0, 0, 'south')
  expected = robot(0, 0, 'east')
  r.move('L') is expected
end

check "Rotating counter-clockwise changes east to north":
  r = robot(0, 0, 'east')
  expected = robot(0, 0, 'north')
  r.move('L') is expected
end

check "Moving forward one facing north increments Y":
  r = robot(0, 0, 'north')
  expected = robot(0, 1, 'north')
  r.move('A') is expected
end

check "Moving forward one facing south decrements Y":
  r = robot(0, 0, 'south')
  expected = robot(0, -1, 'south')
  r.move('A') is expected
end

check "Moving forward one facing east increments X":
  r = robot(0, 0, 'east')
  expected = robot(1, 0, 'east')
  r.move('A') is expected
end

check "Moving forward one facing west decrements X":
  r = robot(0, 0, 'west')
  expected = robot(-1, 0, 'west')
  r.move('A') is expected
end

check "Follow series of directions moving east and north from README":
  r = robot(7, 3, 'north')
  expected = robot(9, 4, 'west')
  r.move('RAALAL') is expected
end

check "Follow series of directions moving west and north":
  r = robot(0, 0, 'north')
  expected = robot(-4, 1, 'west')
  r.move('LAAARALA') is expected
end

check "Follow series of directions moving west and south":
  r = robot(2, -7, 'east')
  expected = robot(-3, -8, 'south')
  r.move('RRAAAAALA') is expected
end

check "Follow series of directions moving east and north":
  r = robot(8, 4, 'south')
  expected = robot(11, 5, 'north')
  r.move('LAAARRRALLLL') is expected
end

