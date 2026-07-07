use context starter2024

provide: simulate-game end

include string-dict

fun simulate-game(player-a, player-b):
  play(
    initial-state(
      player-a.map(card-value),
      player-b.map(card-value)))
end

fun card-value(card):
  ask:
    | card == "J" then: 1
    | card == "Q" then: 2
    | card == "K" then: 3
    | card == "A" then: 4
    | otherwise: 0
  end
end

fun initial-state(hand-a, hand-b):
  {
    hand-a: hand-a,
    hand-b: hand-b,
    active-player: "A",
    pile: [list: ],
    seen: [mutable-string-dict: ],
    tricks: 0,
    cards: 0,
    debt: 0
  }
end

fun play(current):
  if current.pile.length() == 0:
    position = position-key(current)

    cases(Option) current.seen.get-now(position):
      | some(_) => game-result("loop", current)
      | none =>
        block:
          current.seen.set-now(position, true)
          take-turn(current)
        end
    end
  else:
    take-turn(current)
  end
end

fun position-key(current):
  current.hand-a.map(encode-card).join-str("") + "|" +
  current.hand-b.map(encode-card).join-str("") + "|" +
  current.active-player
end

fun encode-card(card):
  ask:
    | card == 0 then: "0"
    | card == 1 then: "1"
    | card == 2 then: "2"
    | card == 3 then: "3"
    | otherwise: "4"
  end
end

fun take-turn(current):
  if current.active-player == "A":
    cases(List) current.hand-a:
      | empty => finish-because-active-player-is-out(current)
      | link(card, rest-a) =>
        play-card(card, with-hand-a(rest-a, current))
    end
  else:
    cases(List) current.hand-b:
      | empty => finish-because-active-player-is-out(current)
      | link(card, rest-b) =>
        play-card(card, with-hand-b(rest-b, current))
    end
  end
end

fun with-hand-a(hand-a, current):
  current.{ hand-a: hand-a }
end

fun with-hand-b(hand-b, current):
  current.{ hand-b: hand-b }
end

fun play-card(card, current):
  after-card = current.{
    pile: current.pile.push(card),
    cards: current.cards + 1
  }

  if card > 0:
    play(with-debt(card, switch-active-player(after-card)))
  else if after-card.debt > 0:
    remaining-debt = after-card.debt - 1
    if remaining-debt == 0:
      award-pile-to-opponent(after-card)
    else:
      play(with-debt(remaining-debt, after-card))
    end
  else:
    play(with-debt(0, switch-active-player(after-card)))
  end
end

fun switch-active-player(current):
  current.{ active-player: other-player(current.active-player) }
end

fun with-debt(debt, current):
  current.{ debt: debt }
end

fun award-pile-to-opponent(current):
  won-pile = current.pile.reverse()

  if current.active-player == "A":
    next = current.{
      hand-b: current.hand-b + won-pile,
      active-player: "B",
      pile: [list: ],
      tricks: current.tricks + 1,
      debt: 0
    }
    finish-or-start-next-trick(next)
  else:
    next = current.{
      hand-a: current.hand-a + won-pile,
      active-player: "A",
      pile: [list: ],
      tricks: current.tricks + 1,
      debt: 0
    }
    finish-or-start-next-trick(next)
  end
end

fun finish-or-start-next-trick(current):
  if (current.hand-a.length() == 0) or (current.hand-b.length() == 0):
    game-result("finished", current)
  else:
    play(current)
  end
end

fun other-player(player):
  if player == "A": "B" else: "A" end
end

fun finish-because-active-player-is-out(current):
  if current.pile.length() == 0:
    game-result("finished", current)
  else:
    game-result("finished", current.{ tricks: current.tricks + 1 })
  end
end

fun game-result(status, current):
  { status: status, tricks: current.tricks, cards: current.cards }
end
