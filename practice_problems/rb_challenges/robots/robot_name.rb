class Robot
  LETTERS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z).freeze

  @@names = []
  attr_reader :name

  def initialize
    loop do
      @name = rand_name
      break unless @@names.include? @name
    end
    @@names << @name
  end

  def reset
    @@names.delete(@name)
    @name = rand_name
  end

  def rand_name
    string = ''
    2.times { |_| string << rand_letter }
    3.times { |_| string << rand_num }
    string
  end

  def rand_letter
    rand_index = rand(0..26)
    LETTERS[rand_index]
  end

  def rand_num
    rand(0..9).to_s
  end
end


robot = Robot.new
puts robot.name
puts robot.name