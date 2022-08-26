#Bubble sort
#each pair of consecutive elements is compared
#if the first is greater than the second
# They are swapped
#this is repeated until no swaps are made

#method that takes array as argument
#sorts using bubble sort
#mutate passed array
#array has at least 2 elements
#return sorted array

#OUTCASES
#array already sorted

#PLAN
#Create method that takes single array  as argument
# can be integers or strings, etc.
#initialize swap boolean to false
#loop
# Iterate through array 2 elements at a time
#   Check if first element is greater than 2nd
#     If it is, switch them
#     and set swap to true
# If swap is false break
#return sorted array

def bubble_sort!(arr)
  loop do
    swap = false
    p arr
    arr.each_cons(2) do |el1, el2|
      if el1 > el2
        arr[arr.index(el2)] = el1
        arr[arr.index(el1)] = el2
        swap = true
      end
    end
    break if swap == false
  end
  arr
end

array = [5, 3]
p bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)