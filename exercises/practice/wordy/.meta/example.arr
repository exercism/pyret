use context starter2024

provide: answer end

fun answer(question):
  question
    ^ expression-from-question
    ^ normalize-operations
    ^ string-split-all(_, " ")
    ^ _.filter(lam(token): token <> "" end)
    ^ evaluate(_)
end

fun expression-from-question(question):
  question
    ^ string-replace(_, "What is", "")
    ^ string-replace(_, "?", "")
end

fun normalize-operations(expression):
  expression
    ^ string-replace(_, "multiplied by", "multiplied-by")
    ^ string-replace(_, "divided by", "divided-by")
end

fun evaluate(tokens):
  cases(List) tokens:
    | empty =>
      raise("syntax error")
    | link(token, rest) =>
      cases(Option) string-to-number(token):
        | some(number) =>
          evaluate-remaining(rest, number)
        | none =>
          if is-known-operation(token) or starts-with-minus(token):
            raise("syntax error")
          else:
            raise("unknown operation")
      end
    end
  end
end

fun evaluate-remaining(tokens, total):
  cases(List) tokens:
    | empty =>
      total
    | link(operation-token, rest-tokens) =>
      cases(List) rest-tokens:
        | empty =>
          reject-leftover-token(operation-token)
        | link(number-token, rest) =>
          operation = parse-operation(operation-token)
          number = parse-number(number-token)

          evaluate-remaining(
            rest,
            apply-operation(operation, total, number))
      end
  end
end

fun reject-leftover-token(token):
  if is-syntax-token(token):
    raise("syntax error")
  else:
    raise("unknown operation")
  end
end

fun parse-number(token):
  cases(Option) string-to-number(token):
    | some(number) =>
      number
    | none =>
      raise("syntax error")
  end
end

fun parse-operation(token):
  ask:
    | is-known-operation(token) then:
      token
    | is-syntax-token(token) then:
      raise("syntax error")
    | otherwise:
      raise("unknown operation")
  end
end

fun is-syntax-token(token):
  is-known-operation(token) or is-number-token(token) or starts-with-minus(token)
end

fun is-known-operation(token):
  (token == "plus") or
  (token == "minus") or
  (token == "multiplied-by") or
  (token == "divided-by")
end

fun is-number-token(token):
  cases(Option) string-to-number(token):
    | some(_) =>
      true
    | none =>
      false
  end
end

fun starts-with-minus(token):
  cases(List) string-explode(token):
    | empty =>
      false
    | link(first, _) =>
      first == "-"
  end
end

fun apply-operation(operation, left, right):
  ask:
    | operation == "plus" then:
      left + right
    | operation == "minus" then:
      left - right
    | operation == "multiplied-by" then:
      left * right
    | operation == "divided-by" then:
      left / right
  end
end
