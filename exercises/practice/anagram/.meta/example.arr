provide: find-anagrams end

fun find-anagrams(phrase, candidates):
  detect-anagram = lam(elt, acc):
    phrase-lowered = string-explode(string-to-lower(phrase))
    elt-lowered = string-explode(string-to-lower(elt))
    
    different-order = phrase-lowered <> elt-lowered
    same-letters = phrase-lowered.sort() == elt-lowered.sort()
    
    ask:
      | different-order and same-letters
        then: acc.push(elt)
      | otherwise: acc
    end
  end

  candidates.foldl(detect-anagram, [list: ]).reverse()
end