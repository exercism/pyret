use context starter2024

import lists as L

provide: tick end

deltas = [list:
  [list: -1, -1],
  [list: -1, 0],
  [list: -1, 1],
  [list: 0, -1],
  [list: 0, 1],
  [list: 1, -1],
  [list: 1, 0],
  [list: 1, 1]]

fun tick(matrix):
  ask:
    | matrix.length() == 0 then: [list: ]
    | otherwise:
      rows = matrix.length()
      cols = matrix.get(0).length()

      L.range(0, rows).map(lam(row):
        L.range(0, cols).map(lam(col):
          update-cell(matrix, row, col)
        end)
      end)
  end
end

fun update-cell(matrix, row, col):
  cell = matrix.get(row).get(col)
  alive = count-live-neighbors(matrix, row, col)

  ask:
    | alive == 3 then: 1
    | (cell == 1) and (alive == 2) then: 1
    | otherwise: 0
  end
end

fun count-live-neighbors(matrix, row, col):
  deltas.foldl(lam(delta, total):
    new-row = row + delta.get(0)
    new-col = col + delta.get(1)

    if within-bounds(matrix, new-row, new-col):
      neighbor = matrix.get(new-row).get(new-col)
      total + neighbor
    else:
      total
    end
  end, 0)
end

fun within-bounds(matrix, row, col):
  rows = matrix.length()
  cols = matrix.get(0).length()

  (0 <= row) and (row < rows) and
  (0 <= col) and (col < cols)
end
