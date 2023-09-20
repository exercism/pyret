provide: high-scores end

import lists as L

fun high-scores(scores :: List<NumInteger>) -> Object:
  {
    method latest(self) -> NumInteger:
      self.scores.last()
    end,
    method personal-best(self) -> NumInteger:
      cases(List) self.scores:
        | empty() => 0
        | link(f, _) =>
          self.scores.drop(1).foldl(
            lam(elt, acc):
              if elt > acc:
                elt
              else:
                acc
              end
            end,
            f)
      end
    end,
    method personal-top-three(self) -> List<NumInteger>:
      len = self.scores.length()
      n = 
        if len < 3:
          len
        else:
          3
        end
      
      L.sort(self.scores).reverse().take(n)
    end,
    scores: scores
  }
end