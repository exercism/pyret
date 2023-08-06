provide: label end

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

fun label(colors):
  fun index-of(l, elem):
    if not(l.member(elem)):
      -1
    else:
      cases (List) l:
        | empty => 0
        | link(f, r) =>
          if f == elem:
            0
          else:
            1 + index-of(r, elem)
          end
      end
    end
  end
  
  tens = index-of(RESISTOR-COLORS, colors.get(0))
  ones = index-of(RESISTOR-COLORS, colors.get(1))
  pow = index-of(RESISTOR-COLORS, colors.get(2))
  raw-ohms = ((tens * 10) + ones) * num-expt(10, pow)
  
  digits = num-to-string(raw-ohms)
  
  unit = ask: 
    | string-length(digits) < 4 then:
      'ohms'
    | string-length(digits) < 7 then:
      'kiloohms'
    | string-length(digits) < 10 then:
      'megaohms'
    | string-length(digits) < 13 then:
      'gigaohms'
  end
  
  value = ask: 
    | string-length(digits) < 4 then:
      raw-ohms
    | string-length(digits) < 7 then:
      raw-ohms / 1e3
    | string-length(digits) < 10 then:
      raw-ohms / 1e6
    | string-length(digits) < 13 then:
      raw-ohms / 1e9
  end

  num-to-string(num-truncate(value)) + " " + unit
end
