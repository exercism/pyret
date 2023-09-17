provide: recite end

import lists as L

fun recite(items): 
  cases (List) items:
    | empty => items
    | link(f, r) => 
      L.range(0, L.length(items) - 1)
        ^ map(
        lam(n):
          'For want of a ' + items.get(n) + ' the ' + items.get(n + 1) + ' was lost.'
        end, _)
        ^ _.reverse()
        ^ _.push('And all for the want of a ' + f + '.')
        ^ _.reverse()
  end
end
