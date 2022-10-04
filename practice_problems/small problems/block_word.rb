def block_word?(str)
  block = {'B':'O', 'X':'K', 'D':'Q', 'C':'P', 'N':'A',
           'G':'T', 'R':'E', 'F':'S', 'J':'W', 'H':'U',
           'V':'I', 'L':'Y', 'Z':'M'}
  str.upcase!
  !block.any? do |(key, value)|
    str.include?(key.to_s) && str.include?(value)
  end
end

p block_word?('BATCH')
p block_word?('BUTCH')
p block_word?('jest')