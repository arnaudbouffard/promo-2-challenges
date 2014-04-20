require_relative "wagon_sort"

students = []

begin
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets
  name.chomp! if name
  # TODO: Add the name we just gotto the students array
  students << name if name != ""
  puts students.length
end while name != ""

# TODO: Call `wagon_sort` method and display the sorted student list
students = wagon_sort(students)
print "Congratulations! Your Wagon has #{students.length} students:\n- #{students[0]}"

if students.length == 1
  puts "\n"
elsif students.length == 2
  puts " and #{students[-1]}"
else puts ", #{students[+1..-2].join(", ")} and #{students[-1]}"
end
#{students[+1..-2].join(", ")} and #{students[-1]}"
