#Computer makes random 5 series array
#User guesses array
#Computer gives feedback on which ones match, displays those sections, 
# and countdown timer goes down by one
# Class Mastermind
#   def initialize(game)
#     @game = game
#   end

# To-do
# - use classes better
# - determine how to start turn 2

#12/25 - Figure out why game isn't ending after game is over
# Reduce game to 6 turns
# Figure out way to for user to create code and computer to guess.
  # 1. Prompt- Ask user to play as guesser or mastermin
  # 2. If mastermind, user inputs sequence of codes
  # 3. Computer guesses what the sequence is
  # 4. Output what guest is and what was correct 

# Creates class for both the computer generated guess and the user's guess
class Sequence
  def initialize(name,order)
    @name = name
    @order = order 
  end
end

# This method creates the random computer code by randomly picking a nubmer 
# between 1-6 and assinging it a color.
def computer_code
  $code = ["","","","",""]
  i = 0

  while i < $code.length 
    if rand(1..6) == 1
      $code[i] = "red"
      i+=1
    elsif rand(1..6) == 2
      $code[i] = "blue"
      i+=1
    elsif rand(1..6) == 3
      $code[i] = "yellow"
      i+=1
    elsif rand(1..6) == 4
      $code[i] = "green"
      i+=1
    elsif rand(1..6) == 5
      $code[i] = "purple" 
      i+=1
    elsif rand(1..6) == 6
      $code[i] = "orange" 
      i+=1
    end
  end
  $code
end




def make_guess_array()

  # This method should convert the users guess from a multitude of variations to a lowercase sequence. 
  # How do I loop each iteration on each position?
  # First by making the guess all lowercase and then 
  guess_gets = gets
  $actual_guess = guess_gets.delete("\"").delete("\n").downcase.split(",")

  j = 0 

  while j < $actual_guess.length
    if $actual_guess[j] == "red" or $actual_guess[j] == "r"
      $actual_guess[j] = "red"
      j += 1
    elsif $actual_guess[j] == "blue" or $actual_guess[j] =="b"
      $actual_guess[j] = "blue"
      j += 1
    elsif $actual_guess[j] == "orange" or $actual_guess[j] == "o"
      $actual_guess[j] = "orange"
      j += 1
    elsif $actual_guess[j] == "yellow" or $actual_guess[j] == "y"
      $actual_guess[j] = "yellow"
      j += 1
    elsif $actual_guess[j] == "green" or $actual_guess[j] == "g"
      $actual_guess[j] = "green"
      j += 1
    elsif $actual_guess[j] == "purple" or $actual_guess[j] =="p"
      $actual_guess[j] = "purple"
      j += 1
    end
  end
  $actual_guess
end




def evaluate_guess(guess_array)

  # This method spits out whether each entry was correct or incorrect says which one. 

  i = 0
  while i < guess_array.length
    if guess_array[i] == $code[i]
      puts "Yes! the #{i+1} term is correct! It is #{$code[i]}" 
      i+=1
    else 
      puts "Sorry! The #{i+1} term is not #{guess_array[i]}"
      i+=1
    end
  end
end
  

  
def correct_so_far(guess_array)

  # Creates the array created so far
  
  correct_so_far_array = ["","","","",""]

  if guess_array[0] == $code[0]
    correct_so_far_array[0] = $code[0]
  end

  if guess_array[1] == $code[1]
    correct_so_far_array[1] = $code[1]
  end

  if guess_array[2] == $code[2]
    correct_so_far_array[2] = $code[2]
  end

  if guess_array[3] == $code[3]
    correct_so_far_array[3] = $code[3]
  end

  if guess_array[4] == $code[4]
    correct_so_far_array[4] = $code[4]
  end
    puts  "Your correct entries so far are #{correct_so_far_array}"
end


def game_over_check(guess_array)
  turn = 0 
  $game_over_status = 1
  if guess_array == $code
    $game_over_check = 0
    puts "The game is over! You guessed the code, #{$code}!"
  elsif turn == 10
    $game_over_check = 0
    puts "You've taken too many turns, the actual sequence was #{$code}"
  end
end



# How to prompt user for input 
puts "Hello User! Welcome to Mastermind, a game where you have to guess 5 random colors in a row. The options are Red, Orange, Yellow, Green, Blue, and Purple.
With these guesses, we'll accept the full word or the first letter of the color, (be sure to separate each color with a comma). 
What's is your first guess?"

# sequence_1 = Mastermind.new(sequence)

# Create the random code, ask user for the guess, morph guess to string, create array format 
computer_sequence = Sequence.new("computer_sequence", computer_code)


#guess_sequence = Sequence.new("guess_sequence", actual_guess)


def each_turn()
  turn = 1
  $game_over_status = 1
  computer_code()

  while turn < 10 and $game_over_status == 1 and $actual_guess != $code
    make_guess_array()
    evaluate_guess($actual_guess)
    correct_so_far($actual_guess)
    game_over_check($actual_guess)
    turn += 1

    if turn == 2 and $actual_guess != $code
      puts "What is your 2nd guess?"
    elsif turn == 3 and $actual_guess != $code
      puts "What is your 3rd guess?"
    elsif turn > 3 or turn < 10 and $actual_guess != $code
      puts "What is your #{turn}th guess?"
    end

  end

  if turn == 10 
    game_over_check(guess)
  end
end


each_turn()

# # Creates array based off entry (so any format is acceptable)
# make_guess_array(actual_guess)

# # Confirms what entries in array are create or not correct 
# evaluate_guess(actual_guess)

# # Confirms guesses so far
# correct_so_far(actual_guess)

# Turn 2



# puts actual_guess
# guess_array = actual_guess.split(",")  
# print guess_array[1]
  