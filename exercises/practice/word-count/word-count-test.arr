use context starter2024

include file("word-count.arr")

include string-dict

check "count one word":
  sentence = "word"
  expected = [string-dict: "word", 1]

  word-count(sentence) is expected
end

check "count one of each word":
  sentence = "one of each"
  expected = [string-dict: "one", 1, "of", 1, "each", 1]

  word-count(sentence) is expected
end

check "multiple occurrences of a word":
  sentence = "one fish two fish red fish blue fish"
  expected = [string-dict: "one", 1, "fish", 4, "two", 1, "red", 1, "blue", 1]

  word-count(sentence) is expected
end

check "handles cramped lists":
  sentence = "one,two,three"
  expected = [string-dict: "one", 1, "two", 1, "three", 1]

  word-count(sentence) is expected
end

check "handles expanded lists":
  sentence = "one,\ntwo,\nthree"
  expected = [string-dict: "one", 1, "two", 1, "three", 1]

  word-count(sentence) is expected
end

check "ignore punctuation":
  sentence = "car: carpet as java: javascript!!&@$%^&"
  expected = [string-dict: "car", 1, "carpet", 1, "as", 1, "java", 1, "javascript", 1]

  word-count(sentence) is expected
end

check "include numbers":
  sentence = "testing, 1, 2 testing"
  expected = [string-dict: "testing", 2, "1", 1, "2", 1]

  word-count(sentence) is expected
end

check "normalize case":
  sentence = "go Go GO Stop stop"
  expected = [string-dict: "go", 3, "stop", 2]

  word-count(sentence) is expected
end

check "with apostrophes":
  sentence = "'First: don't laugh. Then: don't cry. You're getting it.'"
  expected = [string-dict: "first", 1, "don't", 2, "laugh", 1, "then", 1, "cry", 1, "you're", 1, "getting", 1, "it", 1]

  word-count(sentence) is expected
end

check "with quotations":
  sentence = "Joe can't tell between 'large' and large."
  expected = [string-dict: "joe", 1, "can't", 1, "tell", 1, "between", 1, "large", 2, "and", 1]

  word-count(sentence) is expected
end

check "substrings from the beginning":
  sentence = "Joe can't tell between app, apple and a."
  expected = [string-dict: "joe", 1, "can't", 1, "tell", 1, "between", 1, "app", 1, "apple", 1, "and", 1, "a", 1]

  word-count(sentence) is expected
end

check "multiple spaces not detected as a word":
  sentence = " multiple   whitespaces"
  expected = [string-dict: "multiple", 1, "whitespaces", 1]

  word-count(sentence) is expected
end

check "alternating word separators not detected as a word":
  sentence = ",\n,one,\n ,two \n 'three'"
  expected = [string-dict: "one", 1, "two", 1, "three", 1]

  word-count(sentence) is expected
end

check "quotation for word with apostrophe":
  sentence = "can, can't, 'can't'"
  expected = [string-dict: "can", 1, "can't", 2]

  word-count(sentence) is expected
end
