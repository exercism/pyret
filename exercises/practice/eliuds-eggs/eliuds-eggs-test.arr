use context starter2024

include file("eliuds-eggs.arr")

check "0 eggs":
  egg-count(0) is 0
end

check "1 egg":
  egg-count(16) is 1
end

check "4 eggs":
  egg-count(89) is 4
end

check "13 eggs":
  egg-count(2000000000) is 13
end

