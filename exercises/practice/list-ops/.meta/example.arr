use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide:
  my-append, 
  my-concatenate,
  my-filter,
  my-length,
  my-map,
  my-foldl,
  my-foldr,
  my-reverse
end
fun my-append(lst1, lst2):
  cases(List) lst1:
    | empty => lst2
    | link(first, rest) =>
      [list: first] + my-append(rest, lst2)
  end
end

fun my-concatenate(lst):
  my-foldl(lst, my-append, [list: ])
end

fun my-filter(lst, f):
  cases(List) lst:
    | empty => lst
    | link(first, rest) =>
      if f(first):
        my-append(
          [list: first],
          my-filter(rest, f))
      else:
        my-filter(rest, f)
      end
  end
end

fun my-length(lst):
  cases(List) lst:
    | empty => 0
    | link(_, rest) => 1 + my-length(rest)
  end
end

fun my-map(lst, f):
  cases(List) lst:
    | empty => lst
    | link(first, rest) =>
      first
        ^ f(_)
        ^ link(_, empty)
        ^ my-append(_, my-map(rest, f))
  end
end


fun my-foldl(lst, f, acc):
  cases(List) lst:
    | empty => acc
    | link(first, rest) =>
      first
        ^ f(acc, _)
        ^ my-foldl(rest, f, _)
  end
end

fun my-foldr(lst, f, acc):
  rec do-foldr = lam(items, initial):
    cases(List) items:
      | empty => initial
      | link(first, rest) =>
        first
          ^ f(_, initial)
          ^ do-foldr(rest, _)
    end    
  end
  
  reversed = my-reverse(lst)
  do-foldr(reversed, acc)
end

fun my-reverse(lst):
 cases(List) lst:
    | empty => lst
    | link(first, rest) =>
      rest
        ^ my-reverse(_)
        ^ my-append(_, [list: first])
 end
end
