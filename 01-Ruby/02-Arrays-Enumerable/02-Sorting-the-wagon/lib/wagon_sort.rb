def wagon_sort(students)
#  sorted = Array.new(students.length)
#  students.each_with_index do |student, index|
#    sorted[index] = students[index].downcase
#  end
#  sorted.sort!
  students.sort! {|x,y| x.downcase <=> y.downcase}
end
