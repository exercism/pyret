use context essentials2020

include file("rna-transcription.arr")

#|
  When working offline, all tests except the first one are skipped by default.
  Once you get the first test running, unskip the next one until all tests pass locally.
  Check the block comment below for further details.
|#

fun empty-string():
  check "Empty RNA sequence":
    to-rna("") is ""
  end
end

fun cytosine-to-guanine():
  check "RNA complement of cytosine is guanine":
    to-rna("C") is "G"
  end
end

fun guanine-to-cytosine():
  check "RNA complement of guanine is cytosine":
    to-rna("G") is "C"
  end
end

fun thymine-to-adenine():
  check "RNA complement of thymine is adenine":
    to-rna("T") is "A"
  end
end

fun adenine-to-uracil():
  check "RNA complement of adenine is uracil":
    to-rna("A") is "U"
  end
end

fun rna-complement():
  check "RNA complement":
    to-rna("ACGTGGTCTTAA") is "UGCACCAGAAUU"
  end
end

#|
  Code to run each test. Each line corresponds to a test above and whether it should be run.
  To mark a test to be run, replace `false` with `true` on that same line after the comma.
  test(test-a, true) will be run. test(test-a, false) will be skipped.
|#

data TestRun: test(run, active) end

[list: 
  test(empty-string, true),
  test(cytosine-to-guanine, false),
  test(guanine-to-cytosine, false),
  test(thymine-to-adenine, false),
  test(adenine-to-uracil, false),
  test(rna-complement, false)
].each(lam(t): when t.active: t.run() end end)
