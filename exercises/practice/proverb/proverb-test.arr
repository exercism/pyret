use context starter2024

include file("proverb.arr")

check "zero pieces":
  recite([list: ]) is [list: ]
end

check "one piece":
  input = [list: "nail"]
  expected = [list: "And all for the want of a nail."]

  recite(input) is expected
end

check "two pieces":
  input = [list: "nail", "shoe"]
  expected = [list:   "For want of a nail the shoe was lost.", 
                      "And all for the want of a nail."]

  recite(input) is expected
end

check "three pieces":
  input = [list: "nail", "shoe", "horse"]
  expected = [list:   "For want of a nail the shoe was lost.",
                      "For want of a shoe the horse was lost.",
                      "And all for the want of a nail."]

  recite(input) is expected
end

check "full proverb":
  input = [list: "nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]
  expected = [list:   "For want of a nail the shoe was lost.",
                      "For want of a shoe the horse was lost.",
                      "For want of a horse the rider was lost.",
                      "For want of a rider the message was lost.",
                      "For want of a message the battle was lost.",
                      "For want of a battle the kingdom was lost.",
                      "And all for the want of a nail."]

  recite(input) is expected
end

check "four pieces modernized":
  input = [list: "pin", "gun", "soldier", "battle"]
  expected = [list:   "For want of a pin the gun was lost.",
                      "For want of a gun the soldier was lost.",
                      "For want of a soldier the battle was lost.",
                      "And all for the want of a pin."]

  recite(input) is expected
end

