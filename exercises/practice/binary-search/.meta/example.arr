provide: binary-search end

fun binary-search(numbers, x):
  n = num-floor((numbers.length() - 1) / 2)
  if numbers.length() == 0 block:
    raise("value not in list")
  else if numbers.get(n) == x:
    n
  else if numbers.get(n) < x:
    var new_numbers = split-at(n + 1, numbers)
    when new_numbers.suffix == numbers block:
      raise("value not in list")
    end
    n + 1 + binary-search(new_numbers.suffix, x)
  else:
    var new_numbers = split-at(n, numbers)
    when new_numbers.prefix == numbers block:
      raise("value not in list")
    end
    binary-search(new_numbers.prefix, x)
  end
end
