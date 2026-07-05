use context starter2024

import lists as L

provide: rebase end

fun rebase(input-base, digits, output-base):
  ask:
    | input-base < 2 then:
      raise("input base must be >= 2")
    | output-base < 2 then:
      raise("output base must be >= 2")
    | not(fits-base(digits, input-base)) then:
      raise("all digits must satisfy 0 <= d < input base")
    | otherwise:
      digits
        ^ to-decimal(_, input-base)
        ^ to-base(_, output-base)
  end
end

fun fits-base(digits, input-base):
  L.all(lam(digit): (0 <= digit) and (digit < input-base) end, digits)
end

fun to-decimal(digits, input-base):
  digits.foldl(lam(digit, total): (total * input-base) + digit end, 0)
end

fun to-base(value, output-base):
  if value == 0:
    [list: 0]
  else:
    collect-digits(value, output-base, [list: ])
  end
end

fun collect-digits(value, output-base, digits):
  if value == 0:
    digits
  else:
    digit = num-modulo(value, output-base)
    next-value = num-floor(value / output-base)
    collect-digits(next-value, output-base, [list: digit] + digits)
  end
end
