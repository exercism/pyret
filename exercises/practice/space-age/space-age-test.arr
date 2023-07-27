include file("space-age.arr")

fun around(delta):
  lam(actual, target):
    num-abs(target - actual) <= delta
  end
end

check "age on Earth":
  on-planet("Earth", 1000000000)  is%(around(0.01)) 31.69
end

check "age on Mercury":
  on-planet("Mercury", 2134835688) is%(around(0.01)) 280.88
end

check "age on Venus":
  on-planet("Venus", 189839836) is%(around(0.01)) 9.78
end

check "age on Mars":
  on-planet("Mars", 2129871239) is%(around(0.01)) 35.88
end

check "age on Jupiter":
  on-planet("Jupiter", 901876382) is%(around(0.01)) 2.41
end

check "age on Saturn":
  on-planet("Saturn", 2000000000) is%(around(0.01)) 2.15
end

check "age on Uranus":
  on-planet("Uranus", 1210123456) is%(around(0.01)) 0.46
end

check "age on Neptune":
  on-planet("Neptune", 1821023456) is%(around(0.01)) 0.35
end

check "invalid planet causes error":
  on-planet("Sun", 680804807) raises "not a planet"
end