provide: color-code, colors end

RESISTOR-COLORS = [list:
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white",
  ]

fun color-code(color):
  fun index-of(l, elem):
    if not(l.member(elem)):
      -1
    else:
      cases (List) l:
        | empty => 0
        | link(f, r) => if f == elem: 0 else: 1 + index-of(r, elem) end
      end
    end
  end

  index-of(RESISTOR-COLORS, color)
end


fun colors():
  RESISTOR-COLORS
end
