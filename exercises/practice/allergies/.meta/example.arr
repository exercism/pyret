use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide-types *

import lists as L

ALLERGENS = [list: 
  "eggs",
  "peanuts",
  "shellfish",
  "strawberries",
  "tomatoes",
  "chocolate",
  "pollen",
  "cats"
]

data Allergies:
  | allergies(score :: Number) with:
    method allergicTo(self, allergen :: String) -> Boolean:
      self.list().member(allergen)
    end,
    method list(self) -> List<String>:
      rec filtered =
        lam(l :: List<String>, num :: Number):
          cases(List) l:
            | empty => [list: ]
            | link(f, r) =>
              new-num = num-truncate(num / 2)
              if num-modulo(num, 2) == 1:
                filtered(r, new-num).push(f)
              else:
                filtered(r, new-num)
              end
          end
        end

      filtered(ALLERGENS, self.score)
    end
end