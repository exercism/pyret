use context essentials2020

provide-types *

include string-dict
import lists as L

data Axis: axis(label, left, right) end

cardinal_axes = [string-dict:
  'north', axis('north', 'west', 'east'),
  'south', axis('south', 'east', 'west'),
  'east', axis('east', 'north','south'),
  'west', axis('west','south', 'north'),
]

data Robot:
  | robot(x :: NumInteger, y :: NumInteger, direction :: String) with:
    method move(self, directions :: String) -> Robot:
      L.foldl(
        lam(acc, elt):
          direction = 
            ask:
              | elt == 'L' then:
                cardinal_axes.get-value(acc.direction).left
              | elt == 'R' then:
                cardinal_axes.get-value(acc.direction).right
              | otherwise:
                acc.direction
            end
          {x; y} =
            if elt == 'A':
              ask:
                | direction == 'north' then:
                  {acc.x; acc.y + 1}
                | direction == 'south' then:
                  {acc.x; acc.y - 1}
                | direction == 'east' then:
                  {acc.x + 1; acc.y}
                | direction == 'west' then:
                  {acc.x - 1; acc.y}
              end
            else:
              {acc.x; acc.y}
            end
          robot(x, y, direction)
        end,
        self,
        string-explode(directions))
  end
end
