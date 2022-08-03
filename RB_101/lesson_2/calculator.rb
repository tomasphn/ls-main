# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

puts "Welcome to Calculator!"

puts "What's the first number?"
number1 = gets.chomp.to_i

puts "What's the first number?"
number2 = gets.chomp.to_i

puts "What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == "add"
  result = number1 + number2
elsif operator == "subtract"
  result == number1 - number2
elsif operator == "multiply"
  result == number1 * number2
elsif operator == "divide"
  result == number1 / number2
end

puts "The result is #{result}"

