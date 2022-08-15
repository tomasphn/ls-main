# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
def operation_to_message(opr)
  case opr
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

name = ''

puts 'Welcome to Calculator! Enter your name:'
loop do
  name = gets.chomp
  break unless name.empty?

  puts 'Make sure to use a valid name'
end

puts "Hi #{name}!"

loop do # main loop
  number1 = ''
  number2 = ''

  loop do
    puts "What's the first number"
    number1 = gets.chomp

    if number1.to_i.to_s == number1
      number1 = number1.to_i # using this instead of valid number so it can accept 0's
      break
    else
      puts "Hmm... that doesn't look like a valid number"
    end
  end

  loop do
    puts "What's the second number"
    number2 = gets.chomp

    if number2.to_i.to_s == number2
      number2 = number2.to_i
      break
    else
      puts "Hmm... that doesn't look like a valid number"
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) divide
    4) multiply
  MSG
  operator = ''
  puts operator_prompt
  loop do
    operator = gets.chomp.downcase
    p operator
    break if %w[1 2 3 4].include?(operator)

    puts 'Must choose 1, 2, 3, or 4'
  end

  puts "#{operation_to_message(operator)} the two numbers..."
  result = case operator
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1.to_f / number2
           end

  puts "The result is #{result}"

  puts 'Do you want to perform another calculation? (Y to calculate again)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

puts 'Thank you for using the calculator. Goodbye!'