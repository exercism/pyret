use context starter2024

provide: rows end

fun rows(count):
  build-rows(count, [list: ]).reverse()
end

fun build-rows(remaining, state):
  ask:
    | remaining == 0 then:
      state
    | state.length() == 0 then:
      build-rows(remaining - 1, [list: [list: 1]])
    | otherwise:
      previous = state.get(0)
      next-state = [list: next-row(previous)] + state
      build-rows(remaining - 1, next-state)
  end
end

fun next-row(previous):
  padded = [list: 0] + previous + [list: 0]

  range(0, previous.length() + 1).map(lam(index):
    padded.get(index) + padded.get(index + 1)
  end)
end
