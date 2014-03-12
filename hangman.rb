require './hangman_computer.rb'
class Hangman
  def initialize
   option = ""
   until option == "g" || option == "p"
     puts "Welcome 2 Hangman, wud u lik 2 guess a word or pick a word? (g or p)"
     option = gets.chomp
   end

    case option
      when "g" # we need to write this functionality.
        "too bad"
      when "p" #the computer picks
        begin_computer_ai
      else
        "please enter a correct le"
    end #case
  end #initialize







  def begin_computer_ai
    game_over = false
    puts "Welcome_Hangman, how_many_letter?"
    word_length = gets.chomp.to_i
    computer_ai = Computer_ai.new(word_length)

    current_knowledge = "." * word_length

    computer_guess = computer_ai.most_frequent_letter(current_knowledge)
    # p "solved_up_to #{current_knowledge}"
 #    p "The Computer Guessed: #{computer_guess},"
 #    p "Enter the new 'solve_up_to' string"
 #    current_knowledge = gets.chomp

    until game_over
      computer_guess = computer_ai.most_frequent_letter(current_knowledge)
      p "solved_up_to #{current_knowledge}"
      p "The Computer Guessed: #{computer_guess}"
      p "Enter the new 'solve_up_to' string"
      current_knowledge = gets.chomp
      puts "Did the computer win? (Y/N)"
      game_over = (gets.chomp.upcase == "Y")
    end

  end#method

end #class





