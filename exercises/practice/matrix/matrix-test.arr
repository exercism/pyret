use context essentials2020

include file("matrix.arr")

check "extract row from one number matrix":
  m = matrix("1")
  m.row(1) is [list: 1]
end

check "can extract row":
  m = matrix("1 2\n3 4")
  m.row(2) is [list: 3, 4]
end

check "extract row where numbers have different widths":
  m = matrix("1 2\n10 20")
  m.row(2) is [list: 10, 20]
end

check "can extract row from non-square matrix with no corresponding column":
  m = matrix("1 2 3\n4 5 6\n7 8 9\n8 7 6")
  m.row(4) is [list: 8, 7, 6]
end

check "extract column from one number matrix":
  m = matrix("1")
  m.column(1) is [list: 1]
end

check "can extract column":
  m = matrix("1 2 3\n4 5 6\n7 8 9")
  m.column(3) is [list: 3, 6, 9]
end

check "can extract column from non-square matrix with no corresponding row":
  m = matrix("1 2 3 4\n5 6 7 8\n9 8 7 6")
  m.column(4) is [list: 4, 8, 6]
end

check "extract column where numbers have different widths":
  m = matrix("89 1903 3\n18 3 1\n9 4 800")
  m.column(2) is [list: 1903, 3, 4]
end