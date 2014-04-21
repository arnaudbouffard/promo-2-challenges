require_relative 'orange_tree'

naranjo = OrangeTree.new
100.times do
  naranjo.one_year_passes!

  break unless naranjo.alive?
end
puts "Naranko died dude... He was #{naranjo.age} years old"
