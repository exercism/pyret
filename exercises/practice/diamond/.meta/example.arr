use context starter2024

provide: rows end

FIRST-LETTER = string-to-code-point("A")

fun rows(letter):
  size = (string-to-code-point(letter) - FIRST-LETTER) + 1
  top = range(0, size).map(
    lam(index): row-for(index, size) end)

  top + split-at(1, top.reverse()).suffix
end

fun row-for(index, size):
  letter = string-from-code-point(FIRST-LETTER + index)
  outside = string-repeat(" ", size - 1 - index)

  if index == 0:
    outside + letter + outside
  else:
    inside = string-repeat(" ", (2 * index) - 1)
    outside + letter + inside + letter + outside
  end
end
