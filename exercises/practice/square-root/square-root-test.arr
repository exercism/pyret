include file("square-root.arr")

check "root of 1":
  square-root(1) is 1
end

check "root of 4":
  square-root(4) is 2
end

check "root of 25":
  square-root(25) is 5
end

check "root of 81":
  square-root(81) is 9
end

check "root of 196":
  square-root(196) is 14
end

check "root of 65025":
  square-root(65025) is 255
end