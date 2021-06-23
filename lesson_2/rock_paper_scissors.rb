MOVES = %w(rock paper scissors spock lizard)
SHORT_MOVES = %w(r p sc sp li)

def prompt(message)
  puts "-->#{message}"
end

=begin
def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "rock" && second == "lizard") ||
    (first == "paper" && second == "rock") ||
    (first == "paper" && second == "spock") ||
    (first == "scissors" && second == "paper") ||
    (first == "scissors" && second == "lizard") ||
    (first == "lizard" && second == "spock") ||
    (first == "lizard" && second == "paper") ||
    (first == "spock" && second == "rock") ||
    (first == "spock" && second == "scissors")
end
=end

def win?(first, second)
  (first.start_with?("r") && second.start_with?("sc")) ||
    (first.start_with?("r") && second.start_with?("l")) ||
    (first.start_with?("p") && second.start_with?("r")) ||
    (first.start_with?("p") && second.start_with?("sp")) ||
    (first.start_with?("sc") && second.start_with?("p")) ||
    (first.start_with?("sc") && second.start_with?("l")) ||
    (first.start_with?("l") && second.start_with?("sp")) ||
    (first.start_with?("l") && second.start_with?("p")) ||
    (first.start_with?("sp") && second.start_with?("r")) ||
    (first.start_with?("sp") && second.start_with?("sc"))
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lost!")
  else
    prompt("It's a tie!")
  end
end

loop do # main execution loop
  user_score = 0
  computer_score = 0

  loop do
    player_choice = ""
    loop do
      prompt("Choose one: #{MOVES.join(', ')}")
      prompt("Shortcuts: r -> rock; p -> paper; sc -> scissors; sp -> spock; li -> lizard")
      player_choice = gets.chomp.downcase
      if MOVES.include?(player_choice) || SHORT_MOVES.include?(player_choice)
        break
      else
        prompt("Sorry, that's not a valid move.")
      end
    end

    computer_choice = MOVES.sample

    user_move = MOVES.select { |m| m.start_with?(player_choice) }

    prompt("You chose #{user_move.join}, computer chose #{computer_choice}")

    display_result(player_choice, computer_choice)

    if win?(player_choice, computer_choice)
      user_score += 1
    elsif win?(computer_choice, player_choice)
      computer_score += 1
    end

    if user_score == 3
      puts "You have 3 points - you won the game!"
      break
    elsif computer_score == 3
      puts "Computer has 3 points - you lost the game!"
      break
    end

    prompt("your score is: #{user_score}, computer score is #{computer_score}")

    prompt("Do you want to go to the next round?")
    repeat_answer = gets.chomp.downcase

    break unless repeat_answer.start_with?("y")
  end

  prompt("Do you want to start another tournament?")
  repeat_tournament = gets.chomp.downcase
  break unless repeat_tournament.start_with?("y")
end

prompt("Thank you for playing! Bye!")
