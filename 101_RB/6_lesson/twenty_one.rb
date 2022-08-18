def create_deck
  cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  cards += cards + cards + cards
end

def deal(hnd)
  hnd << DECK.shift
end

def join_and(arr)
  "#{arr[0..-2].join(', ')}, and #{arr[-1]}"
end

def display_hands(p_hand, d_hand)
  puts "Dealer has: #{d_hand[1..-1].join(', ')}, and unknown card"
  puts "You have: #{join_and(p_hand)}"
end

def open_deal(p_hand, d_hand)
  2.times do
    deal(p_hand)
    deal(d_hand)
  end
end

def sum_hand(hnd)
  sum = hnd.map do |card|
    if card =~ /[JQK]/
      card = '10'
    elsif card == 'A'
      card = '11'
    end
    card.to_i
  end

  while sum.sum > 21 && sum.include?(11)
    sum[sum.index(11)] = 1
  end
  sum.sum
end

loop do
  loop do
    DECK = create_deck.shuffle!
    player_hand = Array.new
    dealer_hand = Array.new

    open_deal(player_hand, dealer_hand)

    loop do
      display_hands(player_hand, dealer_hand)
      break if sum_hand(player_hand) >= 21
      puts 'Would you like to hit or stay?'
      ans = gets.chomp
      break if ans.downcase == 'stay'
      deal(player_hand)
    end

    if sum_hand(player_hand) > 21
      puts "You busted, you lose..."
      break
    end

    until sum_hand(dealer_hand) >= 17
      puts "The dealer hits"
      deal(dealer_hand)
      display_hands(player_hand, dealer_hand)
    end

    if sum_hand(dealer_hand) > 21
      puts "The dealer busted, you win!"
      break
    end

    puts "The dealer stays"
    puts "You're score is: #{sum_hand(player_hand)}"
    puts "The dealer's score is: #{sum_hand(dealer_hand)}"
    sum_hand(dealer_hand) < sum_hand(player_hand) ? (puts 'You win!') : (puts 'You lost..')
    break
  end
  puts 'Would you like to play again? (y or n)'
  ans = gets.chomp
  break unless ans.downcase == 'y'
end

puts "Thanks for playing!"
