use context starter2024

include file("allergies.arr")

check "testing for eggs allergy -> not allergic to anything":
  item = "eggs"
  score = 0
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for eggs allergy -> allergic only to eggs":
  item = "eggs"
  score = 1
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for eggs allergy -> allergic to eggs and something else":
  item = "eggs"
  score = 3
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for eggs allergy -> allergic to something, but not eggs":
  item = "eggs"
  score = 2
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for eggs allergy -> allergic to everything":
  item = "eggs"
  score = 255
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for peanuts allergy -> not allergic to anything":
  item = "peanuts"
  score = 0
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for peanuts allergy -> allergic only to peanuts":
  item = "peanuts"
  score = 2
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for peanuts allergy -> allergic to peanuts and something else":
  item = "peanuts"
  score = 7
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for peanuts allergy -> allergic to something, but not peanuts":
  item = "peanuts"
  score = 5
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for peanuts allergy -> allergic to everything":
  item = "peanuts"
  score = 255
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for shellfish allergy -> not allergic to anything":
  item = "shellfish"
  score = 0
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for shellfish allergy -> allergic only to shellfish":
  item = "shellfish"
  score = 4
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for shellfish allergy -> allergic to shellfish and something else":
  item = "shellfish"
  score = 14
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for shellfish allergy -> allergic to something, but not shellfish":
  item = "shellfish"
  score = 10
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for shellfish allergy -> allergic to everything":
  item = "shellfish"
  score = 255
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for strawberries allergy -> not allergic to anything":
  item = "strawberries"
  score = 0
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for strawberries allergy -> allergic only to strawberries":
  item = "strawberries"
  score = 8
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for strawberries allergy -> allergic to strawberries and something else":
  item = "strawberries"
  score = 28
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for strawberries allergy -> allergic to something, but not strawberries":
  item = "strawberries"
  score = 20
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for strawberries allergy -> allergic to everything":
  item = "strawberries"
  score = 255
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for tomatoes allergy -> not allergic to anything":
  item = "tomatoes"
  score = 0
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for tomatoes allergy -> allergic only to tomatoes":
  item = "tomatoes"
  score = 16
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for tomatoes allergy -> allergic to tomatoes and something else":
  item = "tomatoes"
  score = 56
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for tomatoes allergy -> allergic to something, but not tomatoes":
  item = "tomatoes"
  score = 40
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for tomatoes allergy -> allergic to everything":
  item = "tomatoes"
  score = 255
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for chocolate allergy -> not allergic to anything":
  item = "chocolate"
  score = 0
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for chocolate allergy -> allergic only to chocolate":
  item = "chocolate"
  score = 32
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for chocolate allergy -> allergic to chocolate and something else":
  item = "chocolate"
  score = 112
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for chocolate allergy -> allergic to something, but not chocolate":
  item = "chocolate"
  score = 80
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for chocolate allergy -> allergic to everything":
  item = "chocolate"
  score = 255
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for pollen allergy -> not allergic to anything":
  item = "pollen"
  score = 0
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for pollen allergy -> allergic only to pollen":
  item = "pollen"
  score = 64
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for pollen allergy -> allergic to pollen and something else":
  item = "pollen"
  score = 224
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for pollen allergy -> allergic to something, but not pollen":
  item = "pollen"
  score = 160
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for pollen allergy -> allergic to everything":
  item = "pollen"
  score = 255
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for cats allergy -> not allergic to anything":
  item = "cats"
  score = 0
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for cats allergy -> allergic only to cats":
  item = "cats"
  score = 128
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for cats allergy -> allergic to cats and something else":
  item = "cats"
  score = 192
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for cats allergy -> allergic to something, but not cats":
  item = "cats"
  score = 64
  expected = false

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "testing for cats allergy -> allergic to everything":
  item = "cats"
  score = 255
  expected = true

  allergens = allergies(score)
  allergens.allergicTo(item) is expected
end

check "list -> no allergies":
  score = 0
  expected = [list: ]

  allergens = allergies(score)
  allergens.list() is expected
end

check "list -> just eggs":
  score = 1
  expected = [list: "eggs"]

  allergens = allergies(score)
  allergens.list() is expected
end

check "list -> just peanuts":
  score = 2
  expected = [list: "peanuts"]

  allergens = allergies(score)
  allergens.list() is expected
end

check "list -> just strawberries":
  score = 8
  expected = [list: "strawberries"]

  allergens = allergies(score)
  allergens.list() is expected
end

check "list -> eggs and peanuts":
  score = 3
  expected = [list: "eggs", "peanuts"]

  allergens = allergies(score)
  allergens.list() is expected
end

check "list -> more than eggs but not peanuts":
  score = 5
  expected = [list: "eggs", "shellfish"]

  allergens = allergies(score)
  allergens.list() is expected
end

check "list -> lots of stuff":
  score = 248
  expected = [list: "strawberries", "tomatoes", "chocolate", "pollen", "cats"]

  allergens = allergies(score)
  allergens.list() is expected
end

check "list -> everything":
  score = 255
  expected = [list: "eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]

  allergens = allergies(score)
  allergens.list() is expected
end

check "list -> no allergen score parts":
  score = 509
  expected = [list: "eggs", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]

  allergens = allergies(score)
  allergens.list() is expected
end

check "list -> no allergen score parts without highest valid score":
  score = 257
  expected = [list: "eggs"]

  allergens = allergies(score)
  allergens.list() is expected
end
