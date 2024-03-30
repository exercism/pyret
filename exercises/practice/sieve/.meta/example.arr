use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: primes end

fun primes(limit) block:
  marks = array-of(true, limit + 1)

  var ps = [list:]
  for each(i from range(2, limit + 1)):
    when marks.get-now(i) block:
      ps := ps.push(i)
      mark-multiples(marks, i, limit)
    end
  end

  ps.reverse()
end

fun mark-multiples(a :: Array<Boolean>, prime :: NumInteger, limit :: NumPositive):
  rec do-mark = lam(i):
    when i <= limit block:
      a.set-now(i, false)
      do-mark(i + prime)
    end
  end

  do-mark(prime * prime)
end
