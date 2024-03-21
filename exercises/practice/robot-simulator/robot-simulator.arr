use context essentials2020 # Don't delete this line when using Pyret on Exercism

provide-types *

data Robot:
  | robot()
    with:
    method move(self, directions :: String) -> Robot:
      ...
    end
end
