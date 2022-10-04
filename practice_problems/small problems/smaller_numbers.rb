# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

#1 make method that takes a single array of numbers as an argument
#2 create uniq array with only unique numbers from given array
#3 for each num in given array
#   check if it is greater than each num in uniq array
#     if it is increment a counter 
#   then replace num with counter
#4 return changed array

def smaller_numbers_than_current(arr)
  uniq = arr.uniq
  arr.map do |num|
    uniq.count {|n| n < num }
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]