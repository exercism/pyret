use context starter2024

provide: transpose end

fun transpose(lines):
  range(0, widest-line-length(lines)).map(lam(column-index):
    transpose-column(lines, column-index)
  end)
end

fun widest-line-length(lines):
  lines.foldl(lam(row-text, widest):
    text-length = string-length(row-text)
    if text-length > widest:
      text-length
    else:
      widest
    end
  end, 0)
end

fun transpose-column(lines, column-index):
  cases(List) lines:
    | empty => ""
    | link(row-text, rest) =>
      transposed-rest = transpose-column(rest, column-index)
      if column-index < string-length(row-text):
        string-char-at(row-text, column-index) + transposed-rest
      else if transposed-rest == "":
        ""
      else:
        " " + transposed-rest
      end
  end
end
