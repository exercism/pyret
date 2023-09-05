use context essentials2020

include file("queen-attack.arr")

check "Test creation of Queens with valid and invalid positions -> queen with a valid position":
  queen(2, 2) does-not-raise
end

check "Test creation of Queens with valid and invalid positions -> queen must have positive row":
  queen(-2, 2) raises "" # matches any exception message
end

check "Test creation of Queens with valid and invalid positions -> queen must have row on board":
  queen(8, 4) raises "" # matches any exception message
end

check "Test creation of Queens with valid and invalid positions -> queen must have positive column":
  queen(2, -2) raises "" # matches any exception message
end

check "Test creation of Queens with valid and invalid positions -> queen must have column on board":
  queen(4, 8) raises "" # matches any exception message
end

check "Test the ability of one queen to attack another -> cannot attack":
  queen(2, 4).can-attack(queen(6, 6)) is false
end

check "Test the ability of one queen to attack another -> can attack on same row":
  queen(2, 4).can-attack(queen(2, 6)) is true
end

check "Test the ability of one queen to attack another -> can attack on same column":
  queen(4, 5).can-attack(queen(2, 5)) is true
end

check "Test the ability of one queen to attack another -> can attack on first diagonal":
  queen(2, 2).can-attack(queen(0, 4)) is true
end

check "Test the ability of one queen to attack another -> can attack on second diagonal":
  queen(2, 2).can-attack(queen(3, 1)) is true
end

check "Test the ability of one queen to attack another -> can attack on third diagonal":
  queen(2, 2).can-attack(queen(1, 1)) is true
end

check "Test the ability of one queen to attack another -> can attack on fourth diagonal":
  queen(1, 7).can-attack(queen(0, 6)) is true
end

check "Test the ability of one queen to attack another -> cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal":
  queen(4, 1).can-attack(queen(2, 5)) is false
end
