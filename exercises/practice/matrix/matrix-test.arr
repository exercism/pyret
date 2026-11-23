use context starter2024

include file("matrix.arr")

check "extract row from one number matrix":
  string = "1"
  index = 1
  expected = [list: 1]

  m = matrix(string)
  m.row(index) is expected
end

check "can extract row":
  string = ```
1 2
3 4
```
  index = 2
  expected = [list: 3, 4]

  m = matrix(string)
  m.row(index) is expected
end

check "extract row where numbers have different widths":
  string = ```
1 2
10 20
```
  index = 2
  expected = [list: 10, 20]

  m = matrix(string)
  m.row(index) is expected
end

check "can extract row from non-square matrix with no corresponding column":
  string = ```
1 2 3
4 5 6
7 8 9
8 7 6
```
  index = 4
  expected = [list: 8, 7, 6]

  m = matrix(string)
  m.row(index) is expected
end

check "extract column from one number matrix":
  string = "1"
  index = 1
  expected = [list: 1]

  m = matrix(string)
  m.column(index) is expected
end

check "can extract column":
  string = ```
1 2 3
4 5 6
7 8 9
```
  index = 3
  expected = [list: 3, 6, 9]

  m = matrix(string)
  m.column(index) is expected
end

check "can extract column from non-square matrix with no corresponding row":
  string = ```
1 2 3 4
5 6 7 8
9 8 7 6
```
  index = 4
  expected = [list: 4, 8, 6]

  m = matrix(string)
  m.column(index) is expected
end

check "extract column where numbers have different widths":
  string = ```
89 1903 3
18 3 1
9 4 800
```
  index = 2
  expected = [list: 1903, 3, 4]

  m = matrix(string)
  m.column(index) is expected
end
