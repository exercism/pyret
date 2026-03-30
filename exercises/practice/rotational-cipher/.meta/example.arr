use context starter2024

provide: my-rotate end

fun my-rotate(phrase, shift-key):
  string-explode(phrase).map(lam(char):
    code = string-to-code-point(char)
    ask:
      | (97 <= code) and (code <= 122) then:
        string-from-code-point(num-modulo(((code - 97) + shift-key), 26) + 97)
      | (65 <= code) and (code <= 90) then:
        string-from-code-point(num-modulo(((code - 65) + shift-key), 26) + 65)
      | otherwise: char
    end
  end).join-str("")
end
