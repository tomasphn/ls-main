#method that takes a single integer n
#evaluates the difference between
# the square of the sum of the first n positive integers
# and the sum of the squares of the first n positive integers

#write method that takes single integer num as argument
#set a variable to an array of 1..num
#set a variable to equal
# the sum of array
# squared **2
#Set another variable to equal
# the array mapped so that each number is squared **2
# summed together
#Subtract the second variable from the first variable
#return the difference

def sum_square_difference(num)
  arr = (1..num).to_a
  sums = arr.sum ** 2
  squares = arr.map {|x| x**2}.sum
  sums - squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150