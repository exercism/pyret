provide: abbreviate end

 fun abbreviate(phrase):
  string-split-all(phrase, " ").foldl(
    lam(section, abbreviation):
      cleaned = string-replace(section, "_", "")
      fragments = string-split-all(cleaned, "-")
      abbreviation + fragments.foldl(
        lam(fragment, acc):
            ask:
            | fragment <> "" then:
              acc + string-to-upper(string-char-at(fragment, 0))
            | otherwise:
              acc
            end
        end,
        "")
    end,
    "")
end