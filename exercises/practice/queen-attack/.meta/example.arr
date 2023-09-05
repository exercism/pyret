use context essentials2020

provide-types *

fun is-on-board(n :: NumInteger) -> Boolean:
  (n >= 0) and (n <= 7)
end

data Queen:
  | queen(row :: NumInteger%(is-on-board), column :: NumInteger%(is-on-board))
    with:
    method can-attack(self, other :: Queen) -> Boolean:
      (self.row == other.row) or
      (self.column == other.column) or
      (
        num-abs(other.column - self.column)
          == num-abs(other.row - self.row)
      )
    end
end