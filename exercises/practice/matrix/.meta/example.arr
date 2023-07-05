provide: matrix end

fun matrix(input :: String):
  process-input = lam():
    to-number = lam(s :: String): 
      cases(Option) string-to-number(s):
        | some(a) => a
        | none => raise("invalid number")
      end
    end

    rows = string-split-all(input, "\n")
    rows.map(lam(r): string-split-all(r, " ").map(to-number) end)
  end
  
  {
    method row(self, nth :: Number): self.values.get(nth - 1) end,
    method column(self, nth :: Number):
      n = nth - 1
      self.values.foldl(lam(elt, acc):
          ask:
            | elt.length() > n then:
              val = elt.get(n)
              acc.push(val)
            | otherwise:
              acc
          end
        end, [list: ]).reverse()
    end,
    values: process-input()
  }
end