require_relative './age_in_days'

### Talking with the user ###
a = Array.new(3)

["year", "month", "day"].each_with_index do | element, index|
  puts "What\'s your #{element} of birth ?"
  a[index] = gets.chomp.to_i
  puts a
end

# tried to find a way to refactor variables naming ie. something like
# "birth_#{element}" = gets.chomp_to_i, in vain

#############################

puts 'Computing your age (with the most complicated algorithms)........'

calculated_age = age_in_days(a[2], a[1], a[0])

puts "You are #{calculated_age} days old... phew!"
