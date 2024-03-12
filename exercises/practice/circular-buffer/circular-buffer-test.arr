use context essentials2020

include file("circular-buffer.arr")

#|
  When working offline, all tests except the first one are skipped by default.
  Once you get the first test running, unskip the next one until all tests pass locally.
  Check the block comment below for further details.
|#

fun read-empty-buffer-should-fail():
  check "reading empty buffer should fail":
    make-buffer(1).read() raises "empty buffer"
  end
end

fun can-read-an-item-just-written():
  check "can read an item just written":
    make-buffer(1).write(1).read() is 1
  end
end

fun each-item-may-only-be-read-once():
  check "each item may only be read once":
    results = make-buffer(1).write(1).read()
    results.{0} is 1
    results.{1}.read() raises "empty buffer"
  end
end

fun items-are-read-in-the-order-they-are-written():
  check "items are read in the order they are written":
    var results = make-buffer(2).write(1).write(2).read()
    results.{0} is 1
    results = results.{1}.read()
    results.{0} is 2
  end
end

fun full-buffer-can-not-be-written-to():
  check "full buffer can't be written to":
    make-buffer(1).write(1).write(2) raises "full buffer"
  end
end

fun a-read-frees-up-capacity-for-another-write():
  check "a read frees up capacity for another write":
    var results = make-buffer(1).write(1).read()
    results.{0} is 1
    results = results.{1}.write(2).read()
    results.{0} is 2
  end
end

fun read-position-is-maintained-even-across-multiple-writes():
  check "read position is maintained even across multiple writes":
    var results = make-buffer(3).write(1).write(2).read()
    results.{0} is 1
    results = results.{1}.write(3).read()
    results.{0} is 2
    results = results.{1}.read()
    results.{0} is 3
  end
end

fun items-cleared-out-of-buffer-can-not-be-read():
  check "items cleared out of buffer can't be read":
    results = make-buffer(1).write(1).clear()
    results.read() raises "empty buffer"
  end
end

fun clear-frees-up-capacity-for-another-write():
  check "clear frees up capacity for another write":
    results = make-buffer(1).write(1).clear().write(2)
    results.read() is 2
  end
end

fun clear-does-nothing-on-empty-buffer():
  check "clear does nothing on empty buffer":
    results = make-buffer(1).clear().write(1)
    results.read() is 1
  end
end

fun overwrite-acts-like-write-on-non-full-buffer():
  check "overwrite acts like write on non-full buffer":
    ...
  end
end

fun overwrite-replaces-the-oldest-item-on-full-buffer():
  check "overwrite replaces the oldest item on full buffer":
    ...
  end
end

fun overwrite-replaces-the-oldest-item-remaining-in-buffer-following-a-read():
  check "overwrite replaces the oldest item remaining in buffer following a read":
    ...
  end
end

fun initial-clear-does-not-affect-wrapping-around():
  check "initial clear does not affect wrapping around":
    ...
  end
end

#|
  Code to run each test. Each line corresponds to a test above and whether it should be run.
  To mark a test to be run, replace `false` with `true` on that same line after the comma.
  test(test-a, true) will be run. test(test-a, false) will be skipped.
|#

data TestRun: test(run, active) end

[list:
  test(read-empty-buffer-should-fail, true),
  test(can-read-an-item-just-written, false),
  test(each-item-may-only-be-read-once, false),
  test(items-are-read-in-the-order-they-are-written, false),
  test(full-buffer-can-not-be-written-to, false),
  test(a-read-frees-up-capacity-for-another-write, false),
  test(read-position-is-maintained-even-across-multiple-writes, false),
  test(items-cleared-out-of-buffer-can-not-be-read, false),
  test(clear-frees-up-capacity-for-another-write, false),
  test(clear-does-nothing-on-empty-buffer, false),
  test(overwrite-acts-like-write-on-non-full-buffer, false),
  test(overwrite-replaces-the-oldest-item-on-full-buffer, false),
  test(overwrite-replaces-the-oldest-item-remaining-in-buffer-following-a-read, false),
  test(initial-clear-does-not-affect-wrapping-around, false),
  test(zero-steps-for-one, true),
  test(divide-if-even, false),
  test(even-and-odd-steps, false),
  test(large-number-of-even-and-odd-steps, false),
  test(zero-is-an-error, false),
  test(negative-is-an-error, false)
].each(lam(t): when t.active: t.run() end end)
