use context essentials2020

include file("atbash-cipher.arr")

check "encode -> encode yes":
  input = "yes"
  expected = "bvh"

  encode(input) is expected
end

check "encode -> encode no":
  input = "no"
  expected = "ml"
  
  encode(input) is expected
end

check "encode -> encode OMG":
  input = "OMG"
  expected = "lnt"
  
  encode(input) is expected
end

check "encode -> encode spaces":
  input = "O M G"
  expected = "lnt"
  
  encode(input) is expected
end

check "encode -> encode mindblowingly":
  input = "mindblowingly"
  expected = "nrmwy oldrm tob"
  
  encode(input) is expected
end

check "encode -> encode numbers":
  input = "Testing,1 2 3, testing."
  expected = "gvhgr mt123 gvhgr mt"
  
  encode(input) is expected
end

check "encode -> encode deep thought":
  input = "Truth is fiction."
  expected = "gifgs rhurx grlm"
  
  encode(input) is expected
end

check "encode -> encode all the letters":
  input = "The quick brown fox jumps over the lazy dog."
  expected = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
  
  encode(input) is expected
end

check "decode -> decode exercism":
  input = "vcvix rhn"
  expected = "exercism"
  
  decode(input) is expected
end

check "decode -> decode a sentence":
  input = "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
  expected = "anobstacleisoftenasteppingstone"
  
  decode(input) is expected
end

check "decode -> decode numbers":
  input = "gvhgr mt123 gvhgr mt"
  expected = "testing123testing"
  
  decode(input) is expected
end

check "decode -> decode all the letters":
  input = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
  expected = "thequickbrownfoxjumpsoverthelazydog"
  
  decode(input) is expected
end

check "decode -> decode with too many spaces":
  input = "vc vix    r hn"
  expected = "exercism"
  
  decode(input) is expected
end

check "decode -> decode with no spaces":
  input = "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
  expected = "anobstacleisoftenasteppingstone"
  
  decode(input) is expected
end