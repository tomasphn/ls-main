# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

#write a method that takes a single array of integers as an argument
#sort the array
#iterate through the array 
#  mark down the "closeness" of the numbers in a seperate array
#Find the minimum of the "closeness" array
#using its index return the pair of numbers closest together

def closest_numbers(arr)
  sorted = arr.sort
  close = sorted.each_cons(2).map do |nums|
    (nums[0] - nums[1]).abs
  end
  small_indx = close.index(close.min)
  num1 = sorted[small_indx]
  num2 = sorted[small_indx + 1]
  arr.select { |x| x == num1 || x == num2 }
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]