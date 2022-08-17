INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
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

def initialize_board
  (1..9).each_with_object({}) {|num, hash| hash[num] = INITIAL_MARKER}
end


def empty_squares(brd)
  brd.keys.select{|num| brd[num] == INITIAL_MARKER}
end

def player_plays!(brd)
  square = ''
  loop do 
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

board = initialize_board
display_board(board)
player_plays!(board)
display_board(board)