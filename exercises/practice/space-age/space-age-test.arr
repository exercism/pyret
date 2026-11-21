use context starter2024

include file("space-age.arr")

fun around(delta :: Number) -> (Number, Number -> Boolean):
  doc: "provides a predicate that returns true if the absolute values of two numbers are less than or equal to the specified delta"
  lam(actual, target):
    num-abs(target - actual) <= delta
  end
end

check "age on Earth":
  planet = "Earth"
  seconds = 1000000000
  expected = 31.69

  on-planet(planet, seconds) is%(around(0.01)) expected
end

check "age on Mercury":
  planet = "Mercury"
  seconds = 2134835688
  expected = 280.88

  on-planet(planet, seconds) is%(around(0.01)) expected
end

check "age on Venus":
  planet = "Venus"
  seconds = 189839836
  expected = 9.78

  on-planet(planet, seconds) is%(around(0.01)) expected
end

check "age on Mars":
  planet = "Mars"
  seconds = 2129871239
  expected = 35.88

  on-planet(planet, seconds) is%(around(0.01)) expected
end

check "age on Jupiter":
  planet = "Jupiter"
  seconds = 901876382
  expected = 2.41

  on-planet(planet, seconds) is%(around(0.01)) expected
end

check "age on Saturn":
  planet = "Saturn"
  seconds = 2000000000
  expected = 2.15

  on-planet(planet, seconds) is%(around(0.01)) expected
end

check "age on Uranus":
  planet = "Uranus"
  seconds = 1210123456
  expected = 0.46

  on-planet(planet, seconds) is%(around(0.01)) expected
end

check "age on Neptune":
  planet = "Neptune"
  seconds = 1821023456
  expected = 0.35

  on-planet(planet, seconds) is%(around(0.01)) expected
end

check "invalid planet causes error":
  planet = "Sun"
  seconds = 680804807

  on-planet(planet, seconds) raises "not a planet"
end
