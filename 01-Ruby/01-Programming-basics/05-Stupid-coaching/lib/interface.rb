
require_relative "coach_answer"
#TODO: Implement the program that makes you discuss with your coach from the terminal.
a = gets.chomp
until a == "I am going to work right now SIR !"
  coach_answer(a)
  a = gets.chomp
end
