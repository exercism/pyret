use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide-types *

import equality as E

# Replace the ... with your code to pass the tests. Good luck!

data Clock:
  | clock(hours :: NumInteger, minutes :: NumInteger)
sharing:
  method add(self, minutes :: NumInteger) -> Clock:
    ...
  end,
  method subtract(self, minutes :: NumInteger) -> Clock:
    ...
  end,
  method normalize(self) -> Clock:
    ...
  end,
  method _equals(self, other :: Clock, _) -> E.EqualityResult:
    # The callback argument after other is ignored for this exercise
    ...
  end,
  method to-string(self) -> String:
    ...
  end
end
