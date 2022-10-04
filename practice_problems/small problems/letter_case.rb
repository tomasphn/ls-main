def letter_percentages(str)
  chars = str.chars
  sol = {lowercase: 0, uppercase: 0, neither: 0}
  chars.each do |char|
    if char =~ /\W|\d|\s/
      sol[:neither] += 1
    elsif char == char.upcase
      sol[:uppercase] += 1
    elsif char == char.downcase
      sol[:lowercase] += 1
    end
  end
  p sol
  sol.each do |(key, value)|
    sol[key] = ((value.to_f / str.length) * 100).round(1)
  end
  p sol
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }