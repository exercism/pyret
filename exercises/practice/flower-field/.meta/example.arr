use context starter2024

import lists as L

provide: annotate end

deltas = [list:
  [list: -1, -1],
  [list: -1, 0],
  [list: -1, 1],
  [list: 0, -1],
  [list: 0, 1],
  [list: 1, -1],
  [list: 1, 0],
  [list: 1, 1]]

cell-labels = [list: " ", "1", "2", "3", "4", "5", "6", "7", "8"]

fun indexed-map(items, f):
  L.range(0, items.length())
    ^ map(lam(index): f(items.get(index), index) end, _)
end

fun annotate(garden):
  if garden.length() == 0:
    [list: ]
  else:
    state = {
      garden: garden,
      rows: garden.length(),
      cols: string-length(garden.get(0))
    }

    indexed-map(state.garden, lam(row, row-index):
      annotate-row(state, row, row-index)
    end)
  end
end

fun annotate-row(state, row, row-index):
  string-explode(row)
    ^ indexed-map(_, lam(cell, col-index):
      label-cell(state, cell, row-index, col-index)
    end)
    ^ _.join-str("")
end

fun label-cell(state, cell, row-index, col-index):
  if cell == "*":
    "*"
  else:
    neighbor-flowers = count-neighbor-flowers(state, row-index, col-index)
    cell-labels.get(neighbor-flowers)
  end
end

fun count-neighbor-flowers(state, row-index, col-index):
  deltas.foldl(lam(delta, total):
    neighbor-row = row-index + delta.get(0)
    neighbor-col = col-index + delta.get(1)

    if within-bounds(state, neighbor-row, neighbor-col) and
        has-flower(state, neighbor-row, neighbor-col):
      total + 1
    else:
      total
    end
  end, 0)
end

fun within-bounds(state, row, col):
  (0 <= row) and (row < state.rows) and
  (0 <= col) and (col < state.cols)
end

fun has-flower(state, row, col):
  string-char-at(state.garden.get(row), col) == "*"
end
