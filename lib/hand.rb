class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    total = 0
    ace = false
    @cards.each do |card|
      ace = true if card.blackjack_value == 1
      total += card.blackjack_value
    end
    total += 10 if total <= 11 && ace
    total
  end

  def busted?
    return true if points > 21
    false
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if self.busted?
    return true if other_hand.busted?
    return true if points > other_hand.points
    false
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
