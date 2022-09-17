class Card
  include Comparable

  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = find_value
  end

  def <=>(other_card)
    value <=> other_card.value
  end

  def find_value
    return rank if rank.is_a? Integer

    case rank
    when "Jack"
      11
    when "Queen"
      12
    when "King"
      13
    when "Ace"
      14
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :deck

  def initialize
    reset
    shuffle_deck
  end

  def reset
    @deck = new_deck
  end

  def new_deck
    RANKS.each_with_object([]) do |rank, arr|
      SUITS.each do |suit|
        arr << Card.new(rank, suit)
      end
    end
  end

  def shuffle_deck
    deck.shuffle!
  end

  def draw
    reset if deck.empty?
    deck.shift
  end
end

# Include Card and Deck classes from the last two exercises.

class PokerHand
  HAND_SIZE = 5

  attr_reader :hand, :deck, :rank_tally, :values, :suits_tally

  def initialize(hand_array)
    @deck = Deck.new
    @hand = hand_array
    @rank_tally = find_ranks
    @values = find_values
    @suits_tally = find_suits
  end

  # def new_hand
  #   @hand = [] 
  #   HAND_SIZE.times { hand << deck.draw }
  # end

  def find_ranks
    hand.map(&:rank).tally
  end

  def find_suits
    hand.map(&:suit).tally
  end

  def find_values
    hand.map(&:value)
  end

  def unique_values?
    values.uniq == values
  end

  def print
    hand.each { |card| puts card}
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    straight_flush? && hand.max.rank == 'Ace'
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    rank_tally.any? { |rank, count| count == 4 }
  end

  def full_house?
    three_of_a_kind? && two_pair?
  end

  def flush?
    suits_tally.any? { |suit, count| count == 5 }
  end

  def straight?
    unique_values? && (values.min + 4 == values.max)
  end

  def three_of_a_kind?
    rank_tally.any? { |rank, count| count == 3 }
  end

  def two_pair?
    pairs = rank_tally.count { |rank, count| count > 1 }
    pairs > 1
  end

  def pair?
    rank_tally.any? { |rank, count| count == 2 }
  end
end


# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.rank_tally
puts hand.evaluate
puts hand.evaluate == 'Flush'

# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(6, 'Diamonds')
# ])
# puts hand.evaluate == 'Three of a kind'

# hand = PokerHand.new([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Two pair'

# hand = PokerHand.new([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Pair'

# hand = PokerHand.new([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])
# puts hand.evaluate == 'High card'