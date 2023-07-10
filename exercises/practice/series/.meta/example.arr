provide: series end

fun slices(series, len):
  ask:
    | series == "" then:
      raise("series cannot be empty")
    | len == 0 then:
      raise("slice length cannot be zero")
    | len < 0 then:
      raise("slice length cannot be negative")
    | string-length(series) < len then:
      raise("slice length cannot be greater than series length")
  | otherwise:
      range(0, (string-length(series) - len) + 1).map(
        lam(idx): string-substring(series, idx, idx + len) end)
  end
end