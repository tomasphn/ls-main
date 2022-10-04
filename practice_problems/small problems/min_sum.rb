# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# create method that takes a single array of integers as an argument
# return nil if the array contains fewer than 5 elements
# Take the first 5 consecutive numbers in the array
#   add them up
# return them

def minimum_sum(arr)
  return nil if arr.length < 5

  sol = []
  arr[0..-5].each_with_index do |_, index|
    sol << arr[index..(index + 4)].sum
  end
  sol.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
