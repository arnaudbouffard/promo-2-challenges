def bugged_concatenate(a, b, c, d, e)
  array = [] << a.to_s.upcase << b.to_s.upcase << c.to_s.upcase << d.to_s.upcase << e.to_s.upcase
  result = array.reduce('') do |output, element|
    output + element
  end
  puts result
end

def build_1984_title
  bugged_concatenate(1, '9', 84, ' ', 'George Orwell')
end
