def sum_with_while(min, max)
  # TODO: return the sum of the integers between min and max
  # CONSTRAINT: you should use a while..end structure
=begin
  if min > max do
      temp = min
      min = max
      max = temp
    end
  end
=end
    sum = 0
    index = min
    while index <= max
      sum += index
      index += 1
    end
    sum
end

def sum_with_for(min, max)
  # TODO: return the sum of the integers between min and max
  # CONSTRAINT: you should use a for..end structure
=begin
  if min > max do
      temp = min
      min = max
      max = temp
    end
  end
=end
  sum = 0
  for i in min..max do
    sum += i
  end
  sum
end

def sum_recursive(min, max)
  # TODO: return the sum of the integers between min and max
  # CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself
end
