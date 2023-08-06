include file("clock.arr")

check "Create a new clock with an initial time -> on the hour":
  clock(8, 0).normalize().to-string() is "08:00"
end

check "Create a new clock with an initial time -> past the hour":
  clock(11, 09).normalize().to-string() is "11:09"
end

check "Create a new clock with an initial time -> midnight is zero hours":
  clock(24, 0).normalize().to-string() is "00:00"
end

check "Create a new clock with an initial time -> hour rolls over":
  clock(25, 0).normalize().to-string() is "01:00"
end

check "Create a new clock with an initial time -> hour rolls over continuously":
  clock(100, 0).normalize().to-string() is "04:00"
end

check "Create a new clock with an initial time -> sixty minutes is next hour":
  clock(1, 60).normalize().to-string() is "02:00"
end

check "Create a new clock with an initial time -> minutes roll over":
  clock(0, 160).normalize().to-string() is "02:40"
end

check "Create a new clock with an initial time -> minutes roll over continuously":
  clock(0, 1723).normalize().to-string() is "04:43"
end

check "Create a new clock with an initial time -> hour and minutes roll over":
  clock(25, 160).normalize().to-string() is "03:40"
end

check "Create a new clock with an initial time -> hour and minutes roll over continuously":
  clock(201, 3001).normalize().to-string() is "11:01"
end

check "Create a new clock with an initial time -> hour and minutes roll over to exactly midnight":
  clock(72, 8640).normalize().to-string() is "00:00"
end

check "Create a new clock with an initial time -> negative hour":
  clock(-1, 15).normalize().to-string() is "23:15"
end

check "Create a new clock with an initial time -> negative hour rolls over":
  clock(-25, 0).normalize().to-string() is "23:00"
end

check "Create a new clock with an initial time -> negative hour rolls over continuously":
  clock(-91, 0).normalize().to-string() is "05:00"
end

check "Create a new clock with an initial time -> negative minutes":
  clock(1, -40).normalize().to-string() is "00:20"
end

check "Create a new clock with an initial time -> negative minutes roll over":
  clock(1, -160).normalize().to-string() is "22:20"
end

check "Create a new clock with an initial time -> negative minutes roll over continuously":
  clock(1, -4820).normalize().to-string() is "16:40"
end

check "Create a new clock with an initial time -> negative sixty minutes is previous hour":
  clock(2, -60).normalize().to-string() is "01:00"
end

check "Create a new clock with an initial time -> negative hour and minutes both roll over":
  clock(-25, -160).normalize().to-string() is "20:20"
end

check "Create a new clock with an initial time -> negative hour and minutes both roll over continuously":
  clock(-121, -5810).normalize().to-string() is "22:10"
end

check "Add minutes -> add minutes":
  clock(10, 0).add(3).to-string() is "10:03"
end

check "Add minutes -> add no minutes":
  clock(6, 41).add(0).to-string() is "06:41"
end

check "Add minutes -> add to next hour":
  clock(0, 45).add(40).to-string() is "01:25"
end

check "Add minutes -> add more than one hour":
  clock(10, 0).add(61).to-string() is "11:01"
end

check "Add minutes -> add more than two hours with carry":
  clock(0, 45).add(160).to-string() is "03:25"
end

check "Add minutes -> add across midnight":
  clock(23, 59).add(2).to-string() is "00:01"
end

check "Add minutes -> add more than one day (1500 min = 25 hrs)":
  clock(5, 32).add(1500).to-string() is "06:32"
end

check "Add minutes -> add more than two days":
  clock(1, 1).add(3500).to-string() is "11:21"
end

check "Subtract minutes -> subtract minutes":
  clock(10, 3).subtract(3).to-string() is "10:00"
end

check "Subtract minutes -> subtract to previous hour":
  clock(10, 3).subtract(30).to-string() is "09:33"
end

check "Subtract minutes -> subtract more than an hour":
  clock(10, 3).subtract(70).to-string() is "08:53"
end

check "Subtract minutes -> subtract across midnight":
  clock(0, 3).subtract(4).to-string() is "23:59"
end

check "Subtract minutes -> subtract more than two hours":
  clock(0, 0).subtract(160).to-string() is "21:20"
end

check "Subtract minutes -> subtract more than two hours with borrow":
  clock(6, 15).subtract(160).to-string() is "03:35"
end

check "Subtract minutes -> subtract more than one day (1500 min = 25 hrs)":
  clock(5, 32).subtract(1500).to-string() is "04:32"
end

check "Subtract minutes -> subtract more than two days":
  clock(2, 20).subtract(3000).to-string() is "00:20"
end

check "Compare two clocks for equality -> clocks with same time":
  clock(15, 37) is clock(15, 37)
end

check "Compare two clocks for equality -> clocks a minute apart":
  clock(15, 36) is-not clock(15, 37)
end

check "Compare two clocks for equality -> clocks an hour apart":
  clock(14, 37) is-not clock(15, 37)
end

check "Compare two clocks for equality -> clocks with hour overflow":
  clock(10, 37) is clock(34, 37)
end

check "Compare two clocks for equality -> clocks with hour overflow by several days":
  clock(3, 11) is clock(99, 11)
end

check "Compare two clocks for equality -> clocks with negative hour":
  clock(22, 40) is clock(-2, 40)
end

check "Compare two clocks for equality -> clocks with negative hour that wraps":
  clock(17, 3) is clock(-31, 3)
end

check "Compare two clocks for equality -> clocks with negative hour that wraps multiple times":
  clock(13, 49) is clock(-83, 49)
end

check "Compare two clocks for equality -> clocks with minute overflow":
  clock(0, 1) is clock(0, 1441)
end

check "Compare two clocks for equality -> clocks with minute overflow by several days":
  clock(2, 2) is clock(2, 4322)
end

check "Compare two clocks for equality -> clocks with negative minute":
  clock(2, 40) is clock(3, -20)
end

check "Compare two clocks for equality -> clocks with negative minute that wraps":
  clock(4, 10) is clock(5, -1490)
end

check "Compare two clocks for equality -> clocks with negative minute that wraps multiple times":
  clock(6, 15) is clock(6, -4305)
end

check "Compare two clocks for equality -> clocks with negative hours and minutes":
  clock(7, 32) is clock(-12, -268)
end

check "Compare two clocks for equality -> clocks with negative hours and minutes that wrap":
  clock(18, 7) is clock(-54, -11513)
end

check "Compare two clocks for equality -> full clock and zeroed clock":
  clock(24, 0) is clock(0, 0)
end
