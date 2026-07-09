use context starter2024

provide: sublist end

fun sublist(list-one, list-two):
  ask:
    | list-one == list-two then: "equal"
    | contains-sublist(list-two, list-one) then: "sublist"
    | contains-sublist(list-one, list-two) then: "superlist"
    | otherwise: "unequal"
  end
end

fun contains-sublist(outer, inner):
  cases(List) inner:
    | empty => true
    | link(_, _) =>
      cases(List) outer:
        | empty => false
        | link(_, rest) =>
          starts-with(outer, inner) or contains-sublist(rest, inner)
      end
    end
end

fun starts-with(outer, inner):
  cases(List) inner:
    | empty => true
    | link(first-inner, rest-inner) =>
      cases(List) outer:
        | empty => false
        | link(first-outer, rest-outer) =>
          (first-outer == first-inner) and starts-with(rest-outer, rest-inner)
      end
  end
end
