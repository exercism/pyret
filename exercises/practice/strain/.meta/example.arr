provide: keep, discard end

fun keep(sequence, predicate):
  sequence.foldl(
    lam(elt, acc):
      if predicate(elt):
        acc.push(elt)
      else:
        acc
      end
    end,
    [list: ]).reverse()
end

fun discard(sequence, predicate):
  keep(sequence, lam(elt): not(predicate(elt)) end)
end
