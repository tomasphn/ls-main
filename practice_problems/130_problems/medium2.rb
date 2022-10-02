# params 2

# def gather(array)
#   yield(array)
# end

# birds = %w(raven finch hawk eagle)

# gather(birds) do |_, _, *raptors|
#   puts "Raptors: #{raptors.join(' and ')}"
# end


# params 3

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# gather(items) do |*stuff, wheat|
#   puts stuff.join(', ')
#   puts wheat
# end

# gather(items) do |apples, *veg, wheat|
#   puts apples
#   puts veg.join(' and ')
#   puts wheat
# end

# gather(items) do |apples, *stuff|
#   puts apples
#   puts stuff.join(', ')
# end

# gather(items) do |apples, corn, cabbage, wheat|
#   puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
# end


# method 2 proc

# # Replace the two `method_name` placeholders with actual method calls
# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# # Replace `argument` with the correct argument below
# # `method` is `Object#method`, not a placeholder
# base8_proc = method(:convert_to_base_8).to_proc

# # We'll need a Proc object to make this code work
# # Replace `a_proc` with the correct object
# [8, 10, 12, 14, 16, 33].map(&base8_proc)

# bubble sort 2
# come back to later

#