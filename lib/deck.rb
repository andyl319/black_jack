require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    arr = []
    Card.suits.each do |suit|
      Card.values.each do |val|
        arr << Card.new(suit, val)
      end
    end
    arr
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if n > count
    arr = []
    n.times do
      arr << @cards.shift
    end
    arr
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    cards.each do |card|
      @cards.push(card)
    end
  end
end
