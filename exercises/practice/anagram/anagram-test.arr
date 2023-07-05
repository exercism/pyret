include file("anagram.arr")

check "no matches":
  candidates = [list: "hello", "world", "zombies", "pants"]
  expected = [list: ]

  find-anagrams("diaper", candidates) is expected
end

check "detects two anagrams":
  candidates = [list: "lemons", "cherry", "melons"]
  expected = [list: "lemons", "melons"]

  find-anagrams("solemn", candidates) is expected
end

check "does not detect anagram subsets":
  candidates = [list: "dog", "goody"]
  expected = [list: ]

  find-anagrams("good", candidates) is expected
end

check "detects anagram":
  candidates = [list: "enlists", "google", "inlets", "banana"]
  expected = [list: "inlets"]

  find-anagrams("listen", candidates) is expected
end

check "detects three anagrams":
  candidates = [list: "gallery", "ballerina", "regally", "clergy", "largely", "leading"]
  expected = [list: "gallery", "regally", "largely"]

  find-anagrams("allergy", candidates) is expected
end

check "detects multiple anagrams with different case":
  candidates = [list: "Eons", "ONES"]
  expected = [list: "Eons", "ONES"]

  find-anagrams("nose", candidates) is expected
end

check "does not detect non-anagrams with identical checksum":
  candidates = [list: "last"]
  expected = [list: ]

  find-anagrams("mass", candidates) is expected
end

check "detects anagrams case-insensitively":
  candidates = [list: "cashregister", "Carthorse", "radishes"]
  expected = [list: "Carthorse"]

  find-anagrams("Orchestra", candidates) is expected
end

check "detects anagrams using case-insensitive subject":
  candidates = [list: "cashregister", "carthorse", "radishes"]
  expected = [list: "carthorse"]

  find-anagrams("Orchestra", candidates) is expected
end

check "detects anagrams using case-insensitive possible matches":
  candidates = [list: "cashregister", "Carthorse", "radishes"]
  expected = [list: "Carthorse"]

  find-anagrams("orchestra", candidates) is expected
end

check "does not detect an anagram if the original word is repeated":
  candidates = [list: "go Go GO"]
  expected = [list: ]

  find-anagrams("go", candidates) is expected
end

check "anagrams must use all letters exactly once":
  candidates = [list: "patter"]
  expected = [list: ]

  find-anagrams("tapper", candidates) is expected
end

check "words are not anagrams of themselves":
  candidates = [list: "BANANA"]
  expected = [list: ]

  find-anagrams("BANANA", candidates) is expected
end

check "words are not anagrams of themselves even if letter case is partially different":
  candidates = [list: "Banana"]
  expected = [list: ]

  find-anagrams("BANANA", candidates) is expected
end

check "words are not anagrams of themselves even if letter case is completely different":
  candidates = [list: "banana"]
  expected = [list: ]

  find-anagrams("BANANA", candidates) is expected
end

check "words other than themselves can be anagrams":
  candidates = [list: "LISTEN", "Silent"]
  expected = [list: "Silent"]

  find-anagrams("LISTEN", candidates) is expected
end