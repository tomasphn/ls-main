#define method that receive a single array as an argument
#Return nil if array is empty or nil input
#create solution hash
#iterate through array
#if number does not exist in solution hash
# create k/v pair equal to 1
#if number does exist
# increment k/v pair
#return solution hash

def group_and_count(input)
  return nil if input.nil? || input.empty?

  sol = input.each_with_object({}) do |el, hash|
    if hash[el]
      hash[el] += 1
    else
      hash[el] = 1
    end
  end
  sol
end
