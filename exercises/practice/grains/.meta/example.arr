provide: on-square, total end


fun on-square(n :: Number) -> Number:
  ask:
    | num-is-non-positive(n) then: 
      raise("square must be between 1 and 64")
    | n > 64 then: 
      raise("square must be between 1 and 64")
    | otherwise: 
      num-expt(2, (n - 1))
  end
end

fun total() -> Number:
  num-expt(2, 64) - 1
end