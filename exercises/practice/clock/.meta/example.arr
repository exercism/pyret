use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide-types *

import equality as E

data Clock:
  | clock(hours :: Number, minutes :: Number)
sharing:
  method add(self, minutes :: Number) -> Clock:
    new-clock = clock(self.hours, self.minutes + minutes)

    new-clock.normalize()
  end,
  method subtract(self, minutes :: Number) -> Clock:
    new-clock = clock(self.hours, self.minutes - minutes)

    new-clock.normalize()
  end,
  method normalize(self) -> Clock:
    is-in-range = lam():
      ((self.minutes >= 0) and (self.minutes < 60))
      and ((self.hours >= 0) and (self.hours < 24))
    end

    ask:
      | not(is-in-range()) then:
        additional-hours = num-floor(self.minutes / 60)
        hours = num-modulo((self.hours + additional-hours), 24)
        minutes = num-modulo(self.minutes, 60)

        clock(hours, minutes)
      | otherwise:
        self
    end
  end,
  method _equals(self, other :: Clock, _) -> E.EqualityResult:
    left = self.normalize()
    right = other.normalize()

    if (left.hours == right.hours) and (left.minutes == right.minutes):
      E.Equal
    else:
      E.NotEqual("Clocks represent different periods in time", self, other)
    end
  end,
  method to-string(self) -> String:
    to-two-digits = lam(n):
      stringified = num-to-string(n)
      if string-length(stringified) == 1:
        "0" + stringified
      else:
        stringified
      end
    end

    normalized = self.normalize()

    to-two-digits(normalized.hours) + ":" + to-two-digits(normalized.minutes)
  end
end