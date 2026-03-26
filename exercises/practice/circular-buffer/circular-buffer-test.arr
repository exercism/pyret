use context starter2024

include file("circular-buffer.arr")

check "reading empty buffer should fail":
  buff = make-buffer(1)

  buff.read() raises "empty buffer"
end

check "can read an item just written":
  var buff = make-buffer(1)
  buff := buff.write(1)

  buff.read().{0} is 1
end

check "each item may only be read once":
  var buff = make-buffer(1)
  buff := buff.write(1)

  results = buff.read()
  results.{0} is 1
  results.{1}.read() raises "empty buffer"
end

check "items are read in the order they are written":
  var buff = make-buffer(2)
  buff := buff.write(1)
  buff := buff.write(2)

  var results = buff.read()
  results.{0} is 1
  results := results.{1}.read()
  results.{0} is 2
end

check "full buffer can't be written to":
  var buff = make-buffer(1)
  buff := buff.write(1)

  buff.write(2) raises "full buffer"
end

check "a read frees up capacity for another write":
  var buff = make-buffer(1)
  buff := buff.write(1)

  var results = buff.read()
  results.{0} is 1

  buff := results.{1}.write(2)
  results := buff.read()
  results.{0} is 2
end

check "read position is maintained even across multiple writes":
  var buff = make-buffer(3)
  buff := buff.write(1)
  buff := buff.write(2)

  var results = buff.read()
  results.{0} is 1

  buff := results.{1}
  buff := buff.write(3)

  results := buff.read()
  results.{0} is 2

  buff := results.{1}
  results := buff.read()
  results.{0} is 3
end

check "items cleared out of buffer can't be read":
  var buff = make-buffer(1)
  buff := buff.write(1)
  buff := buff.clear()
  
  buff.read() raises "empty buffer"
end

check "clear frees up capacity for another write":
  var buff = make-buffer(1)
  buff := buff.write(1)
  buff := buff.clear()
  buff := buff.write(2)

  buff.read().{0} is 2
end

check "clear does nothing on empty buffer":
  var buff = make-buffer(1)
  buff := buff.clear()
  buff := buff.write(1)

  results = buff.read()
  results.{0} is 1
end

check "overwrite acts like write on non-full buffer":
  var buff = make-buffer(2)
  buff := buff.write(1)
  buff := buff.overwrite(2)

  var results = buff.read()
  results.{0} is 1

  buff := results.{1}
  results := buff.read()
  results.{0} is 2
end

check "overwrite replaces the oldest item on full buffer":
  var buff = make-buffer(2)
  buff := buff.write(1)
  buff := buff.write(2)
  buff := buff.overwrite(3)

  var results = buff.read()
  results.{0} is 2

  buff := results.{1}
  results := buff.read()
  results.{0} is 3
end

check "overwrite replaces the oldest item remaining in buffer following a read":
  var buff = make-buffer(3)
  buff := buff.write(1)
  buff := buff.write(2)
  buff := buff.write(3)

  var results = buff.read()
  results.{0} is 1

  buff := results.{1}
  buff := buff.write(4)
  buff := buff.overwrite(5)

  results := buff.read()
  results.{0} is 3

  buff := results.{1}
  results := buff.read()
  results.{0} is 4

  buff := results.{1}
  results := buff.read()
  results.{0} is 5
end

check "initial clear does not affect wrapping around":
  var buff = make-buffer(2)
  buff := buff.clear()
  buff := buff.write(1)
  buff := buff.write(2)
  buff := buff.overwrite(3)
  buff := buff.overwrite(4)

  var results = buff.read()
  results.{0} is 3

  buff := results.{1}
  results := buff.read()
  results.{0} is 4

  buff := results.{1}
  buff.read() raises "empty buffer"
end

