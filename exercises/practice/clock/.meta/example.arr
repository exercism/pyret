provide-types *

data Clock:
  | clock(hours :: Number, minutes :: Number)
sharing:
  method add(self, minutes :: Number) -> Clock:
    new-clock = clock(self.hours, self.minutes + minutes)
    ask:
      | new-clock.minutes > 60 then:
        new-clock.normalize()
      | otherwise:
        new-clock
    end
  end,
  method subtract(self, minutes :: Number) -> Clock:
    new-clock = clock(self.hours, self.minutes - minutes)
    ask:
      | new-clock.minutes < 0 then:
        new-clock.normalize()
      | otherwise:
        new-clock
    end
  end,
  method normalize-hours(self) -> Clock:
    additional-hours = num-floor(self.minutes / 60)
    final-hours = num-modulo((self.hours + additional-hours), 24)
    clock(final-hours, self.minutes)
  end,
  method normalize-minutes(self) -> Clock:
    remaining-minutes = num-modulo(self.minutes, 60)
    clock(self.hours, remaining-minutes)
  end,
  method normalize(self) -> Clock:
    self.normalize-hours().normalize-minutes()
  end,
  method values-equal(self, other :: Clock) -> Boolean:
    left = self.normalize()
    right = other.normalize()
    (left.hours == right.hours) and (left.minutes == right.minutes)
  end,
  method to-string(self) -> String:
    to-two-digits = lam(n):
      stringified = num-to-string(n)
      ask:
        | string-length(stringified) == 1 then:
          "0" + stringified
        | otherwise:
          stringified
      end
    end

    to-two-digits(self.hours) + ":" + to-two-digits(self.minutes)
  end
end
