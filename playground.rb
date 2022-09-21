# The relationship between a class and modules
module Royalty
  def initialize
    @title = "Noble"
  end

  def announce_self
    puts "Here comes the magnificent #{@title}"
  end
end

class King
  include Royalty

  def initialize
    @title = "King"
  end
end

class Queen
  include Royalty

  def initialize
    @title = "Queen"
  end
end

class Squire
  include Royalty

  def initialize
    @title = "Squire"
  end
end

class Royal
  include Royalty
end

King.new.announce_self
Queen.new.announce_self
Squire.new.announce_self
Royal.new.announce_self

=begin
What do the method calls on lines 32-35 output? Explain why the code outputs what it does. What concept is exemplified by this code?

- They each print out the individual value of @title for the class
- The method is called from within the class
- For each object that calls it, the method checks their @title and outputs the appropriate message
- This exemplifies polymorphism, the concept where different types of data respond to a common interface

Rubric
Correct output - 1 point
Identification of Polymorphism - 1 point
Explanation of how @title is different for each class and how the in class initialize methods overwrite the module one - 1 point
Explanation of how Ruby searches the direct lexical context of the class, then the module for the method call - 1 point
=end

# The use cases of modules. (Namespacing)

module Athletes
  class Runner
    def do_work
      puts "I'm running on the track!"
    end
  end
end

module FoodStaff
  class Runner
    def do_work
      puts "I'm getting the orders!"
    end
  end
end

# add code here
person1.do_work #=> "I'm running on the track!"
# add code here
person2.do_work #=> "I'm getting the orders!"

=begin
Examine the following code:

How would you edit the code without editing any of the module or class definitions in order to produce the desired output?
What use case of modules does this code exemplify? What are some of it's benefits?

  - Change it to FoodStaff::Runner and Athlete::Runner
  - Exemplifies Namespacing
  - Namespacing allows you to use similarly named classes within code
  - Namespacing allows you to group related classes

Proper changes - 1 point
Identify namespacing correctly - 1 point
Identify at least 1 benefit - 1 point
=end

# The #== method
class Car
  attr_reader :model, :speed

  def initialize(model, speed)
    @model = model
    @speed = speed
  end
end

ford = Car.new("Ford", 55)
benz = Car.new("Benz", 55.00)

puts ford == benz
puts ford.model == benz.model
puts ford.speed == benz.speed

=begin
What does each line output? How do the #== methods on each line differ from one another? Why are they different? 

- outputs false, false, true
- In the first line the Object itself is being compared to see if it is the same one
- In the second line the instance variable @model of each object is being compared
- In the third, the instance variable @speed is being compared
- The == method in the first line comes from the BasicObject class and is checking to see if the two items are the same object
- The == method in the second lin ecomes from the String class and is seeing if they are the same string
- The == method from the third line comes from the Integer class and is checking if the two values are the same, even though they are not the exact same the == method for the Integer class can compare the value of floats and integers

Correct output - 1 point
Identify that that the first line checks if the compared objects are the same - 1 point
Identify that the instance variables @model and @speed are being compared on the other 2 lines - 1 point
Properly identify that the #== method called is based on the value it is called on (integer for integer, string for string, etc) - 1 point
Explain how the #== method comes from BasicObject, but is overwritten by Integer and String in the other cases - 1 point
=end
