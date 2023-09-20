use context essentials2020

include file("dnd-character.arr")

#|
  When working offline, all tests except the first one are skipped by default.
  Once you get the first test running, unskip the next one until all tests pass locally.
  Check the block comment below for further details.
|#

fun modifier-score-3():
  check "ability modifier -> ability modifier for score 3 is -4":
    modifier(3) is -4
  end
end

fun modifier-score-4():
  check "ability modifier -> ability modifier for score 4 is -3":
    modifier(4) is -3
  end
end

fun modifier-score-5():
  check "ability modifier -> ability modifier for score 5 is -3":
    modifier(5) is -3
  end
end

fun modifier-score-6():
  check "ability modifier -> ability modifier for score 6 is -2":
    modifier(6) is -2
  end
end

fun modifier-score-7():
  check "ability modifier -> ability modifier for score 7 is -2":
    modifier(7) is -2
  end
end

fun modifier-score-8():
  check "ability modifier -> ability modifier for score 8 is -1":
    modifier(8) is -1
  end
end

fun modifier-score-9():
  check "ability modifier -> ability modifier for score 9 is -1":
    modifier(9) is -1
  end
end

fun modifier-score-10():
  check "ability modifier -> ability modifier for score 10 is 0":
    modifier(10) is 0
  end
end

fun modifier-score-11():
  check "ability modifier -> ability modifier for score 11 is 0":
    modifier(11) is 0
  end
end

fun modifier-score-12():
  check "ability modifier -> ability modifier for score 12 is +1":
    modifier(12) is 1
  end
end

fun modifier-score-13():
  check "ability modifier -> ability modifier for score 13 is +1":
    modifier(13) is 1
  end
end

fun modifier-score-14():
  check "ability modifier -> ability modifier for score 14 is +2":
    modifier(14) is 2
  end
end

fun modifier-score-15():
  check "ability modifier -> ability modifier for score 15 is +2":
    modifier(15) is 2
  end
end

fun modifier-score-16():
  check "ability modifier -> ability modifier for score 16 is +3":
    modifier(16) is 3
  end
end

fun modifier-score-17():
  check "ability modifier -> ability modifier for score 17 is +3":
    modifier(17) is 3
  end
end

fun modifier-score-18():
  check "ability modifier -> ability modifier for score 18 is +4":
    modifier(18) is 4
  end
end

fun ability-within-range():
  check "random ability is within range":
      is-valid = lam(stat): (stat >= 3) and (stat <= 18) end

      stat = ability()
      is-valid(stat) is true
  end
end

fun random-character-is-valid():
  check "random character is valid":
    is-valid = lam(stat): (stat >= 3) and (stat <= 18) end

    char = character()
    is-valid(char.strength) is true
    is-valid(char.dexterity) is true
    is-valid(char.constitution) is true
    is-valid(char.intelligence) is true
    is-valid(char.wisdom) is true
    is-valid(char.charisma) is true

    (char.hitpoints == modifier(char.constitution)) is true
  end
end

fun calculate-ability-once():
  check "each ability is only calculated once":
    char = character()
    (char.strength == char.strength) is true
  end
end

#|
  Code to run each test. Each line corresponds to a test above and whether it should be run.
  To mark a test to be run, replace `false` with `true` on that same line after the comma.
  test(test-a, true) will be run. test(test-a, false) will be skipped.
|#

data TestRun: test(run, active) end

[list: 
  test(modifier-score-3, true),
  test(modifier-score-4, false),
  test(modifier-score-5, false),
  test(modifier-score-6, false),
  test(modifier-score-7, false),
  test(modifier-score-8, false),
  test(modifier-score-9, false),
  test(modifier-score-10, false),
  test(modifier-score-11, false),
  test(modifier-score-12, false),
  test(modifier-score-13, false),
  test(modifier-score-14, false),
  test(modifier-score-15, false),
  test(modifier-score-16, false),
  test(modifier-score-17, false),
  test(modifier-score-18, false),
  test(ability-within-range, false),
  test(random-character-is-valid, false),
  test(calculate-ability-once, false)
].each(lam(t): when t.active: t.run() end end)