include file("phone-number.arr")

check "cleans the number":
  clean("(223) 456-7890") is "2234567890"
end

check "cleans numbers with dots":
  clean("223.456.7890") is "2234567890"
end

check "cleans numbers with multiple spaces":
  clean("223 456   7890   ") is "2234567890"
end

check "invalid when 9 digits":
  clean("123456789") raises "must not be fewer than 10 digits"
end

check "invalid when 11 digits does not start with a 1":
  clean("22234567890") raises "11 digits must start with 1"
end

check "valid when 11 digits and starting with 1":
  clean("12234567890") is "2234567890"
end

check "valid when 11 digits and starting with 1 even with punctuation":
  clean("+1 (223) 456-7890") is "2234567890"
end

check "invalid when more than 11 digits":
  clean("321234567890") raises "must not be greater than 11 digits"
end

check "invalid with letters":
  clean("523-abc-7890") raises "letters not permitted"
end

check "invalid with punctuations":
  clean("523-@:!-7890") raises "punctuations not permitted"
end

check "invalid if area code starts with 0":
  clean("(023) 456-7890") raises "area code cannot start with zero"
end

check "invalid if area code starts with 1":
  clean("(123) 456-7890") raises "area code cannot start with one"
end

check "invalid if exchange code starts with 0":
  clean("(223) 056-7890") raises "exchange code cannot start with zero"
end

check "invalid if exchange code starts with 1":
  clean("(223) 156-7890") raises "exchange code cannot start with one"
end

check "invalid if area code starts with 0 on valid 11-digit number":
  clean("1 (023) 456-7890") raises "area code cannot start with zero"
end

check "invalid if area code starts with 1 on valid 11-digit number":
  clean("1 (123) 456-7890") raises  "area code cannot start with one"
end

check "invalid if exchange code starts with 0 on valid 11-digit number":
  clean("1 (223) 056-7890") raises "exchange code cannot start with zero"
end

check "invalid if exchange code starts with 1 on valid 11-digit number":
  clean("1 (223) 156-7890") raises "exchange code cannot start with one"
end
