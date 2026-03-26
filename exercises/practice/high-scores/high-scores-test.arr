use context starter2024

include file("high-scores.arr")

check "List of scores":
  scores = [list: 30, 50, 20, 70]
  expected = [list: 30, 50, 20, 70]

  high-scores(scores).scores is expected
end

check "Latest score":
  scores = [list: 100, 0, 90, 30]
  expected = 30

  high-scores(scores).latest() is expected
end

check "Personal best":
  scores = [list: 40, 100, 70]
  expected = 100

  high-scores(scores).personal-best() is expected
end

check "Top 3 scores -> Personal top three from a list of scores":
  scores = [list: 10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]
  expected = [list: 100, 90, 70]

  high-scores(scores).personal-top-three() is expected
end

check "Top 3 scores -> Personal top highest to lowest":
  scores = [list: 20, 10, 30]
  expected = [list: 30, 20, 10]

  high-scores(scores).personal-top-three() is expected
end

check "Top 3 scores -> Personal top when there is a tie":
  scores = [list: 40, 20, 40, 30]
  expected = [list: 40, 40, 30]
  
  high-scores(scores).personal-top-three() is expected
end

check "Top 3 scores -> Personal top when there are less than 3":
  scores = [list: 30, 70]
  expected = [list: 70, 30]
  
  high-scores(scores).personal-top-three() is expected
end

check "Top 3 scores -> Personal top when there is only one":
  scores = [list: 40]
  expected = [list: 40]
  
  high-scores(scores).personal-top-three() is expected
end
