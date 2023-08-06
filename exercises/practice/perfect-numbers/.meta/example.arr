provide: classify end

import lists as L

fun classify(number :: NumInteger) -> String:
  if number <= 0:
    raise("Classification is only possible for positive integers.")
  else if number == 1:
    "deficient" # Can't range from 2 to 1
  else:
    stop = num-truncate(num-to-rational(num-sqrt(number))) + 1
    start = if stop < 2: stop else: 2 end
    
    aliquot-sum = L.range(start, stop).foldl(
      lam(elt, acc):
        if num-modulo(number, elt) == 0:
          increment =
            if (elt * elt) <> number:
              elt + num-truncate(number / elt)
            else:
              elt
            end
          acc + increment
        else:
          acc
        end
      end,
      1) 

    if aliquot-sum < number:
      "deficient"
    else if aliquot-sum == number:
      "perfect"
    else:
      "abundant"
    end
  end
end
