# THIS SEEMS TO WORK HOWEVA RAKE TESTS FAIL
# PLUS did not understand  "In any case this program should exit
# after the first coach's answer." kitt's spec

def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message[-1] == "?" then puts "Silly question, get dressed and go to work !"
  else puts "I don't care son, get dressed and go to work !"
  end
end

# def coach_answer_enhanced(your_message)
#   # TODO: return coach answer to your_message, with additional custom rules of yours !

# end

