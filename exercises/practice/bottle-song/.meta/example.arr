use context starter2024

import lists as L

provide: recite end

counts = [list:
  "no",
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten"]

fun recite(start-bottles, take-down):
  L.range(0, take-down)
    ^ map(lam(i): verse(start-bottles - i) end, _)
    ^ _.join-str("\n\n")
end

fun verse(bottles):
  count = capitalize(counts.get(bottles))
  next-count = counts.get(bottles - 1)
  bottle = bottle-word(bottles)
  next-bottle = bottle-word(bottles - 1)

  count + " green " + bottle + " hanging on the wall,\n" +
  count + " green " + bottle + " hanging on the wall,\n" +
  "And if one green bottle should accidentally fall,\n" +
  "There'll be " + next-count + " green " + next-bottle +
  " hanging on the wall."
end

fun capitalize(word):
  string-to-upper(string-char-at(word, 0)) +
  string-substring(word, 1, string-length(word))
end

fun bottle-word(count):
  if count == 1:
    "bottle"
  else:
    "bottles"
  end
end
