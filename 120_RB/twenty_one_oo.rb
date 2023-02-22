require 'pry'
class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def <<(new_card)
    cards << new_card
  end

  def to_s
    cards.join(', ')
  end

  def total_value
    cards.sum { |card| card.value }
  end

  def newest_card
    cards.last
  end

  def any_expensive_aces?
    cards.any? { |card| card.ace? && card.value == 11 }
  end

  def devalue_ace
    ace_index = cards.index(&:ace?)
    cards[ace_index].devalue
  end
end

class Participant
  attr_reader :hand, :name

  def initialize
    @hand = Hand.new
    @name = self.class
    @computer = nil
  end

  def display_hand
    puts "#{title} has #{hand}. With a total value of #{hand.total_value}"
  end

  def hand_value
    hand.total_value
  end

  def busted?
    return false if hand.total_value <= 21

    return true unless hand.any_expensive_aces?

    loop do
      hand.devalue_ace
      return false if hand.total_value <= 21

      break unless hand.any_expensive_aces?
    end
    true
  end

  def newest_card
    hand.newest_card
  end

  def computer?
    @computer
  end

  def human?
    !computer?
  end

  def title
    human? ? "You" : "The Computer"
  end
end

class Player < Participant
  def initialize
    super
    @computer = false
  end

  def display_hand
    puts "#{title} have #{hand}. With a total value of #{hand.total_value}."
  end
end

class Dealer < Participant
  def initialize
    super
    @computer = true
  end

  def seventeen_or_more?
    hand.total_value >= 17
  end

  def display_hand
    puts "#{title} has #{hand}. With a total value of #{hand.total_value}."
  end

  def display_second_card
    puts "#{title} has 1 uknown card and a #{newest_card}"
  end
end

class Card
  attr_reader :suit, :face
  attr_accessor :value

  def initialize(suit, face, name)
    @suit = suit
    @face = face
    @name = name
    @value = base_value
  end

  def to_s
    "#{face.capitalize} of #{suit_name}"
  end

  def base_value
    case face
    when 'J', 'Q', 'K'
      10
    when 'A'
      11
    else
      face.to_i
    end
  end

  def ace?
    face == 'A'
  end

  def devalue
    self.value = 1
  end

  private

  def suit_name
    case suit
    when 'S'
      'Spades'
    when 'C'
      'Clubs'
    when 'D'
      'Diamonds'
    when 'H'
      'Hearts'
    end
  end
end

class Deck
  SUITS = ['S', 'C', 'H', 'D']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', 'J', 'K', 'Q', 'A']

  attr_accessor :deck

  def initialize
    @deck = []
    create_new_deck
    shuffle
  end

  def deal(participant)
    participant.hand << deck.shift
  end

  def deal_to_table(participants_array)
    participants_array.each { |participant| deal(participant) }
  end

  def show_deck
    puts deck
  end

  def shuffle
    @deck = deck.sort { rand <=> rand }
  end

  def to_s
    deck
  end

  private

  def create_new_deck
    SUITS.each do |suit|
      FACES.each do |face|
        name = face + suit
        card = Card.new(suit, face, name)
        deck << card
      end
    end
  end
end

class Game
  attr_reader :deck, :player, :dealer, :participants

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @participants = [player, dealer]
  end

  def opening_deal
    deck.deal_to_table(participants)
    deck.deal_to_table(participants)
  end

  def take_turn(participant)
    participant.human? ? human_turn(participant) : dealer_turn(participant)
  end

  def human_turn(player)
    loop do
      answer = ask_hit_or_stay
      break if answer == 'stay'

      hit(player) if answer == 'hit'
      puts "You hit and drew a #{player.newest_card}"
      break if player.busted?

      player.display_hand
    end
    turn_over_message(player)
  end

  def dealer_turn(dealer)
    dealer.display_hand
    loop do
      break if dealer.seventeen_or_more?

      hit(dealer)
      puts "The dealer hit and drew a #{dealer.newest_card}"
      dealer.display_hand
      break if dealer.busted?

      sleep(1)
    end
    turn_over_message(dealer)
  end

  def ask_hit_or_stay
    answer = nil
    loop do
      puts "Would you like to hit or stay?"
      answer = gets.chomp.downcase
      break if %w(hit stay).include? answer

      puts "Sorry, you must type 'hit' or 'stay'"
    end
    answer
  end

  def hit(participant)
    deck.deal(participant)
  end

  def turn_over_message(participant)
    participant.busted? ? (puts "Game over, #{participant.title} busted!") : (puts "#{participant.title} stayed")
  end

  def display_participants_hands
    participants.each(&:display_hand)
  end

  def display_opening_hand
    player.display_hand
    dealer.display_second_card
  end

  def announce_winner
    if player.hand_value > dealer.hand_value
      puts "#{player.title} won!"
    elsif dealer.hand_value > player.hand_value
      puts "#{dealer.title} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer

      puts "Sorry, must be y or n"
    end
    return true if answer == 'y'
    return false if answer =='n'
  end

  def opening_message
    puts "Welcome to Twenty-One!"
  end

  def closing_message
    puts "Thanks for playing Twenty-One!"
  end

  def start
    opening_message
    loop do
      loop do
        opening_deal
        display_opening_hand
        take_turn(player)
        break if player.busted?

        take_turn(dealer)
        break if dealer.busted?

        display_participants_hands
        announce_winner
        break
      end
      break unless play_again?
    end
    closing_message
  end
end

Game.new.start

#user validation script
=begin
loop do
puts "Question? (*valid answers*)"
answer = gets.chomp.downcase
break if %w(*valid answers*).include? answer
puts "Sorry, must be *valid answers*"
end
=end