use context starter2024

include file("line-up.arr")

check "format smallest non-exceptional ordinal numeral 4":
  format-message("Gianna", 4) is "Gianna, you are the 4th customer we serve today. Thank you!"
end

check "format greatest single digit non-exceptional ordinal numeral 9":
  format-message("Maarten", 9) is "Maarten, you are the 9th customer we serve today. Thank you!"
end

check "format non-exceptional ordinal numeral 5":
  format-message("Petronila", 5) is "Petronila, you are the 5th customer we serve today. Thank you!"
end

check "format non-exceptional ordinal numeral 6":
  format-message("Attakullakulla", 6) is "Attakullakulla, you are the 6th customer we serve today. Thank you!"
end

check "format non-exceptional ordinal numeral 7":
  format-message("Kate", 7) is "Kate, you are the 7th customer we serve today. Thank you!"
end

check "format non-exceptional ordinal numeral 8":
  format-message("Maximiliano", 8) is "Maximiliano, you are the 8th customer we serve today. Thank you!"
end

check "format exceptional ordinal numeral 1":
  format-message("Mary", 1) is "Mary, you are the 1st customer we serve today. Thank you!"
end

check "format exceptional ordinal numeral 2":
  format-message("Haruto", 2) is "Haruto, you are the 2nd customer we serve today. Thank you!"
end

check "format exceptional ordinal numeral 3":
  format-message("Henriette", 3) is "Henriette, you are the 3rd customer we serve today. Thank you!"
end

check "format smallest two digit non-exceptional ordinal numeral 10":
  format-message("Alvarez", 10) is "Alvarez, you are the 10th customer we serve today. Thank you!"
end

check "format non-exceptional ordinal numeral 11":
  format-message("Jacqueline", 11) is "Jacqueline, you are the 11th customer we serve today. Thank you!"
end

check "format non-exceptional ordinal numeral 12":
  format-message("Juan", 12) is "Juan, you are the 12th customer we serve today. Thank you!"
end

check "format non-exceptional ordinal numeral 13":
  format-message("Patricia", 13) is "Patricia, you are the 13th customer we serve today. Thank you!"
end

check "format exceptional ordinal numeral 21":
  format-message("Washi", 21) is "Washi, you are the 21st customer we serve today. Thank you!"
end

check "format exceptional ordinal numeral 62":
  format-message("Nayra", 62) is "Nayra, you are the 62nd customer we serve today. Thank you!"
end

check "format exceptional ordinal numeral 100":
  format-message("John", 100) is "John, you are the 100th customer we serve today. Thank you!"
end

check "format exceptional ordinal numeral 101":
  format-message("Zeinab", 101) is "Zeinab, you are the 101st customer we serve today. Thank you!"
end

check "format non-exceptional ordinal numeral 112":
  format-message("Knud", 112) is "Knud, you are the 112th customer we serve today. Thank you!"
end

check "format exceptional ordinal numeral 123":
  format-message("Yma", 123) is "Yma, you are the 123rd customer we serve today. Thank you!"
end
