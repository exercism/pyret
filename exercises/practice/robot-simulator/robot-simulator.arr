use context essentials2020

provide-types *


CARDINAL_DIRECTIONS = [list:
  'north',
  'east',
  'south',
  'west'
]


data Robot:
  | robot(x :: NumInteger, y :: NumInteger, direction :: String) with:
  method move(self, directions :: String) -> Robot:
    foldl(
        lam(acc, elt):
            cases (String) elt:
                | 'L' =>
                    new-direction = ''
                    robot(acc.x, acc.y, new-direction)
                | 'R' => 
                    new-direction = ''
                    robot(acc.x, acc.y, new-direction)
                | 'A' =>
                    cases (String) acc.direction:
                        | 'north'
                            robot(0, acc.y + 1, self.direction)
                        | 'east'
                            robot(acc.x + 1, 0, self.direction)
                        | 'south'
                            robot(0, acc.y - 1, self.direction)
                        | 'west'
                            robot(acc.x - 1, 0, self.direction)
                    end
        end
    end,
    self,
    string-explode(directions))
  end
end
