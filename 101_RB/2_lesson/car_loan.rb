def valid_input(message)
  puts message
  loop do
    ans = gets.chomp
    ans.to_i.to_s == ans && ans.to_i > 0 ? (return ans.to_i) : (puts 'Please enter a valid number')
  end
end

puts 'Welcome to mortgage calculator!'

p loan_amnt = valid_input('Please enter your loan amount')
p monthly_rate = (valid_input('Please enter your APR percentage as a whole number (ex: for 5%, enter 5)').to_f / 100) / 12
p monthly_dur = valid_input('Please enter the duration of your loan in months')

monthly_pay = loan_amnt * (monthly_rate / (1 - (1 + monthly_rate)**(-monthly_dur)))

puts "Your payment is #{monthly_pay}$ a month"
puts 'Thank you for using mortgage calculator'
