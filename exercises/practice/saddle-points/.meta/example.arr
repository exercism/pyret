use context starter2024

provide-types *

provide: saddle-points end

import lists as L

data TreeLocation:
  | tree(row, column)
end

fun saddle-points(matrix):
  range(1, matrix.length() + 1).foldl(
    lam(row-number, locations):
      locations.append(good-trees-in-row(matrix, row-number))
    end,
    [list: ])
end

fun good-trees-in-row(matrix, row-number):
  row = row-values(matrix, row-number)

  L.fold_n(
    lam(column-index, locations, height):
      column-number = column-index + 1
      column = column-values(matrix, column-number)

      if is-good-tree(height, row, column):
        locations.push(tree(row-number, column-number))
      else:
        locations
      end
    end,
    0,
    [list: ],
    row).reverse()
end

fun is-good-tree(height, row, column):
  is-tallest-in-row(height, row)
    and is-shortest-in-column(height, column)
end

fun is-tallest-in-row(height, row):
  height == largest-value(row)
end

fun is-shortest-in-column(height, column):
  height == smallest-value(column)
end

fun row-values(matrix, row-number):
  matrix.get(row-number - 1)
end

fun column-values(matrix, column-number):
  matrix.map(lam(row): row.get(column-number - 1) end)
end

fun largest-value(numbers):
  numbers.foldl(num-max, numbers.first)
end

fun smallest-value(numbers):
  numbers.foldl(num-min, numbers.first)
end
