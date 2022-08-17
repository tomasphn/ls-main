require "pry"
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def initialize_board
  (1..9).each_with_object({}) { |num, hash| hash[num] = INITIAL_MARKER }
end

def display_board(brd)
  puts "You're a #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}"
  puts "       |       |       "
  puts "   #{brd[1]}   |   #{brd[2]}   |   #{brd[3]}   "
  puts "       |       |       "
  puts "-------+-------+-------"
  puts "       |       |       "
  puts "   #{brd[4]}   |   #{brd[5]}   |   #{brd[6]}   "
  puts "       |       |       "
  puts "-------+-------+-------"
  puts "       |       |       "
  puts "   #{brd[7]}   |   #{brd[8]}   |   #{brd[9]}   "
  puts "       |       |       "
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_plays!(brd)
  square = ''
  loop do
    puts "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def computer_plays!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  winning_lines.each do |line|
    if line.all? { |space| brd[space] == PLAYER_MARKER }
      return 'Player'
    elsif line.all? { |space| brd[space] == COMPUTER_MARKER }
      return 'Computer'
    end
  end
  nil
end

loop do
  board = initialize_board
  loop do
    display_board(board)
    player_plays!(board)
    break if someone_won?(board) || board_full?(board)

    computer_plays!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    puts "#{detect_winner(board)} won!"
  else
    puts "It's a tie!"
  end

  puts "Play again? (y or n)"
  answer = gets.chomp
  break if answer.upcase.start_with?('N')
end

puts "Thanks for playing!"
