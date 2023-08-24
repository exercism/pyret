use context essentials2020

include file("bob.arr")

check "stating something":
  input = "Tom-ay-to, tom-aaaah-to."
  expected = "Whatever."

  response(input) is expected
end

check "shouting":
  input = "WATCH OUT!"
  expected = "Whoa, chill out!"
  
  response(input) is expected
end

check "shouting gibberish":
  input = "FCECDFCAAB"
  expected = "Whoa, chill out!"
  
  response(input) is expected
end

check "asking a question":
  input = "Does this cryogenic chamber make me look fat?"
  expected = "Sure."
  
  response(input) is expected
end

check "asking a numeric question":
  input = "You are, what, like 15?"
  expected = "Sure."
  
  response(input) is expected
end

check "asking gibberish":
  input = "fffbbcbeab?"
  expected = "Sure."
  
  response(input) is expected
end

check "talking forcefully":
  input = "Hi there!"
  expected = "Whatever."
  
  response(input) is expected
end

check "using acronyms in regular speech":
  input = "It's OK if you don't want to go work for NASA."
  expected = "Whatever."
  
  response(input) is expected
end

check "forceful question":
  input = "WHAT'S GOING ON?"
  expected = "Calm down, I know what I'm doing!"
  
  response(input) is expected
end

check "shouting numbers":
  input = "1, 2, 3 GO!"
  expected = "Whoa, chill out!"

  response(input) is expected
end

check "no letters":
  input = "1, 2, 3"
  expected = "Whatever."

  response(input) is expected
end

check "question with no letters":
  input = "4?"
  expected = "Sure."

  response(input) is expected
end

check "shouting with special characters":
  input = "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"
  expected = "Whoa, chill out!"

  response(input) is expected
end

check "shouting with no exclamation mark":
  input = "I HATE THE DENTIST"
  expected = "Whoa, chill out!"

  response(input) is expected
end

check "statement containing question mark":
  input = "Ending with ? means a question."
  expected = "Whatever."

  response(input) is expected
end

check "non-letters with question":
  input = ":) ?"
  expected = "Sure."

  response(input) is expected
end

check "prattling on":
  input = "Wait! Hang on. Are you going to be OK?"
  expected = "Sure."

  response(input) is expected
end

check "silence":
  input = ""
  expected = "Fine. Be that way!"

  response(input) is expected
end

check "prolonged silence":
  input = "          "
  expected = "Fine. Be that way!"

  response(input) is expected
end

check "alternate silence":
  input = "\t\t\t\t\t\t\t\t\t\t"
  expected = "Fine. Be that way!"

  response(input) is expected
end

check "multiple line question":
  input = "\nDoes this cryogenic chamber make me look fat?\nNo."
  expected = "Whatever."

  response(input) is expected
end

check "starting with whitespace":
  input = "         hmmmmmmm..."
  expected = "Whatever."

  response(input) is expected
end

check "ending with whitespace":
  input = "Okay if like my  spacebar  quite a bit?   "
  expected = "Sure."

  response(input) is expected
end

check "other whitespace":
  input = "\n\r \t"
  expected = "Fine. Be that way!"

  response(input) is expected
end

check "non-question ending with whitespace":
  input = "This is a statement ending with whitespace      "
  expected = "Whatever."

  response(input) is expected
end