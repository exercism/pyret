use context starter2024

include file("wordy.arr")

check "just a number":
  question = "What is 5?"
  expected = 5

  answer(question) is expected
end

check "just a zero":
  question = "What is 0?"
  expected = 0

  answer(question) is expected
end

check "just a negative number":
  question = "What is -123?"
  expected = -123

  answer(question) is expected
end

check "addition":
  question = "What is 1 plus 1?"
  expected = 2

  answer(question) is expected
end

check "addition with a left hand zero":
  question = "What is 0 plus 2?"
  expected = 2

  answer(question) is expected
end

check "addition with a right hand zero":
  question = "What is 3 plus 0?"
  expected = 3

  answer(question) is expected
end

check "more addition":
  question = "What is 53 plus 2?"
  expected = 55

  answer(question) is expected
end

check "addition with negative numbers":
  question = "What is -1 plus -10?"
  expected = -11

  answer(question) is expected
end

check "large addition":
  question = "What is 123 plus 45678?"
  expected = 45801

  answer(question) is expected
end

check "subtraction":
  question = "What is 4 minus -12?"
  expected = 16

  answer(question) is expected
end

check "multiplication":
  question = "What is -3 multiplied by 25?"
  expected = -75

  answer(question) is expected
end

check "division":
  question = "What is 33 divided by -3?"
  expected = -11

  answer(question) is expected
end

check "multiple additions":
  question = "What is 1 plus 1 plus 1?"
  expected = 3

  answer(question) is expected
end

check "addition and subtraction":
  question = "What is 1 plus 5 minus -2?"
  expected = 8

  answer(question) is expected
end

check "multiple subtraction":
  question = "What is 20 minus 4 minus 13?"
  expected = 3

  answer(question) is expected
end

check "subtraction then addition":
  question = "What is 17 minus 6 plus 3?"
  expected = 14

  answer(question) is expected
end

check "multiple multiplication":
  question = "What is 2 multiplied by -2 multiplied by 3?"
  expected = -12

  answer(question) is expected
end

check "addition and multiplication":
  question = "What is -3 plus 7 multiplied by -2?"
  expected = -8

  answer(question) is expected
end

check "multiple division":
  question = "What is -12 divided by 2 divided by -3?"
  expected = 2

  answer(question) is expected
end

check "unknown operation":
  question = "What is 52 cubed?"

  answer(question) raises "unknown operation"
end

check "Non math question":
  question = "Who is the President of the United States?"

  answer(question) raises "unknown operation"
end

check "reject problem missing an operand":
  question = "What is 1 plus?"

  answer(question) raises "syntax error"
end

check "reject problem with no operands or operators":
  question = "What is?"

  answer(question) raises "syntax error"
end

check "reject two operations in a row":
  question = "What is 1 plus plus 2?"

  answer(question) raises "syntax error"
end

check "reject two numbers in a row":
  question = "What is 1 plus 2 1?"

  answer(question) raises "syntax error"
end

check "reject postfix notation":
  question = "What is 1 2 plus?"

  answer(question) raises "syntax error"
end

check "reject prefix notation":
  question = "What is plus 1 2?"

  answer(question) raises "syntax error"
end
