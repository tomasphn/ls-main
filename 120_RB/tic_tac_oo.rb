require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts '       |       |       '
    puts "   #{@squares[1]}   |   #{@squares[2]}   |   #{@squares[3]}   "
    puts '       |       |       '
    puts '-------+-------+-------'
    puts '       |       |       '
    puts "   #{@squares[4]}   |   #{@squares[5]}   |   #{@squares[6]}   "
    puts '       |       |       '
    puts '-------+-------+-------'
    puts '       |       |       '
    puts "   #{@squares[7]}   |   #{@squares[8]}   |   #{@squares[9]}   "
    puts '       |       |       '
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def full?
   unmarked_keys.empty?
  end

  def someone_won?
    p !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      test_square = @squares[line[0]]
      return test_square.marker if line.all? { |num| @squares[num].marker == test_square.marker } && test_square.marked?
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker
  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ''
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're a #{human.marker}. The computer is #{computer.marker}"
    puts ''
    board.draw
    puts ''
  end

  def human_move
    square = nil
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_result
    display_board
    if board.winning_marker == HUMAN_MARKER
      puts "You won!"
    elsif board.winning_marker == COMPUTER_MARKER
      puts "The computer won :("
    else
      puts "The board is full, it's a tie!"
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

  def clear_screen_and_display_board
    system 'clear'
    display_board
  end

  def play
    display_welcome_message

    loop do
      display_board
      loop do
        human_move
        break if board.full? || board.someone_won?

        computer_moves
        clear_screen_and_display_board
        break if board.full? || board.someone_won?
      end
      display_result
      break unless play_again?

      board.reset
      puts "Let's play again!"
    end
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
