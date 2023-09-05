use context essentials2020

provide-types *

fun is-on-board(n :: NumInteger) -> Boolean:
  raise("please implement the is-on-board function")
end

data Queen:
  | queen(row :: NumInteger%(is-on-board), column :: NumInteger%(is-on-board))
    with:
    method can-attack(self, other :: Queen) -> Boolean:
        raise("please implement the can-attack method")
    end
end