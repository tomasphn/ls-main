# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

#Write a method that accepts a single string argument
#Turn the string into an array
#iterate over the array
# if the index of the element is odd
#   capitalize the element
#join the array
#return the array

def to_weird_case(str)
  arr = str.split(" ")
  arr = arr.each_with_index do |word, indx|
    if (indx + 1) % 3 == 0
      arr[indx] = word.chars.each_with_index.map { |letter, indx| indx.odd? ? letter.capitalize : letter }.join
    end
  end
  p arr.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
