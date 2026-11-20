use context starter2024

include file("eliuds-eggs.arr")

check "0 eggs":
  number = 0
  expected = 0

  egg-count(number) is expected
end

check "1 egg":
  number = 16
  expected = 1

  egg-count(number) is expected
end

check "4 eggs":
  number = 89
  expected = 4

  egg-count(number) is expected
end

check "13 eggs":
  number = 2000000000
  expected = 13

  egg-count(number) is expected
end
