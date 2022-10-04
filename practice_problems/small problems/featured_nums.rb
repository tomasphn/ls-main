#featured nums
# odd number
# multiple of 7
# digits occur once each

#method that takes a single integer as argument
#returns next featured num
# greater then argument
#Return error if there is no next featured num

#PROBLEMS
#What is the greatest possible featured num? 
# 9876543201
#   since it must be odd(cant end in 0) and can only feature each digit once
#   Is divisible by 7 cuz luck?

#PLAN
#create method that takes single integer as argument
#Return error message if number is equal to or greater than biggest featured num
#counting upwards from given num
# Check if counted number is a featured num
#   odd
#   divisible by 7
#   One digit each
#     Tally, values, see if any larger than 1
#   IF it is featured num 
#     Return num

def featured(num)
  return "No possible number" if num >= 9876543201
  loop do
    num += 1
    return num if num.odd? && num % 7 == 0 && num.digits.uniq == num.digits
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
