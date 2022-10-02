ten = Enumerator.new do |y|
  counter = 0
  accumulator = 1
  loop do
    accumulator = counter.zero? ? 1 : accumulator * counter
    y << accumulator
    counter += 1
  end
end

ten.each do |x, y|
  puts "x: #{x}"
  puts "y: #{y}"
  break if x > 5 
end