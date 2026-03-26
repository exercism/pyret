use context starter2024

include file("hello-world.arr")

fun say-hi():
  check "Say Hi!":
    hello() is "Hello, World!"
  end
end

#|
  Code to run each test. Each line corresponds to a test above and whether it should be run.
  To mark a test to be run, replace `false` with `true` on that same line after the comma.
  test(test-a, true) will be run. test(test-a, false) will be skipped.
|#

data TestRun: test(run, active) end

[list: 
  test(say-hi, true)
].each(lam(t): when t.active: t.run() end end)
