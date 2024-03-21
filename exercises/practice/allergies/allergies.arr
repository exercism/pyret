use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide-types *

data Allergies:
  | allergies(score :: Number) with:
    method allergicTo(self, allergen :: String) -> Boolean:
      raise("please implement the allergicTo method")
    end,
    method list(self) -> List<String>:
      raise("please implement the list method")
    end
end
