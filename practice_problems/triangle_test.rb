#takes 3 triangles as arguments
#returns a symbol
#right acute or obtuse depending on angles
#returns invalid if not a triangle
#OUTCASES
#Sum must be 180
#all angles greater than 0
#RIGHT
#If valid triangle
#and if one angle is 90 degrees
#ACUTE
#If no angle is greater than 90%
#OBTUSE
#If any angle is greater than 90 degrees

#PLAN
#create method that takes 3 integer angles as arguments
#create array of angles
#return :invalid 
# if angles dont equal 180 degrees 
#   sum the array of angles and check if equal to 180
# or if any angles are 0 or less
#   Check if all are greater than 0
#Check if Right triangle
# Return :right
#  if angle array includes 90
#check if obtuse triangle
# Return :obtuse
#   If any angle in arr > 90
#else is acute triangle
# Return :acute otherwise

def triangle(ang1, ang2, ang3)
  arr = [ang1, ang2, ang3]
  return :invalid unless arr.sum == 180 && arr.all? {|x| x > 0}

  if arr.include?(90)
    return :right
  elsif arr.any? {|x| x > 90}
    return :obtuse
  else
    return :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid