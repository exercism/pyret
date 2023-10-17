use context essentials2020

provide: egg-count end

fun egg-count(n):
  fun recurse(val, eggs):
    if val == 0:
      eggs
    else if num-is-positive(num-modulo(val, 2)):
      recurse(num-truncate(val / 2), eggs + 1)
    else:
      recurse(num-truncate(val / 2), eggs)
    end
  end
  
  recurse(n, 0)
end
