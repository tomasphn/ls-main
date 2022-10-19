class Cipher
  LETTERS = 26
  CAPITAL_RANGE = (65..90)
  LOWERCASE_RANGE = (97..122)

  def self.rotate(string, rotation_size)
    @rotation_size = rotation_size
    rotated_chars = string.chars.map do |char|
      find_ord(char).chr
    end

    rotated_chars.join
  end

  def self.find_ord(char)
    return char unless char =~ /[a-zA-Z]/

    rotated_ord = char.ord + @rotation_size
    if CAPITAL_RANGE.include?(char.ord)
      rotated_ord > CAPITAL_RANGE.last ? (rotated_ord - LETTERS) : rotated_ord
    else
      rotated_ord > LOWERCASE_RANGE.last ? (rotated_ord - LETTERS) : rotated_ord
    end
  end
end