provide: convert end

RULES = [list: [list: 3, "Pling"], [list: 5, "Plang"], [list: 7, "Plong"]]

fun convert(n):

  is-divisible-by = lam(f): num-modulo(n, f) == 0 end

  fun check-rules(l, acc):
    cases (List) l:
      | empty => acc
      | link(f, r) => if (is-divisible-by(f.get(0))): f.get(1) + check-rules(r, acc) else: check-rules(r, acc) end
    end
  end

  sound = check-rules(RULES, "")

  if string-length(sound) == 0:
    num-to-string(n)
  else:
    sound
  end
end
