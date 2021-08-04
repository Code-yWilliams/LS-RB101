=begin
Tic-Tac-Toe - this program creates a game "board" using a hash of keys that
represent coordinates of the board, and values that represent an "X" (player),
"O" (computer), or ""(available / blank square). When player chooses a
square by typing in the corresponding coordinate, the board hash is mutated
accordingly. Program then checks if there is a winner or if the board is full.
If not, it crandomlychooses a Computer move by selecting from an array of
all the hash values that are empty (this array contains all available spaces
at that point in time). It then checks again if there is a winner or if the
board is full. If not, then it loops and asks the player to select
another square, and so on. If there is a winner, then the winner's name
('Computer' or 'You' for 'Player') is displayed. If the board is full and
there is no winner, then "It's a tie!" is displayed. All of this is wrapped
into a loop that breaks if the user enters anything but "yes" or "y"
when prompted at the end if they would like to play again.
=end

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"

WINNING_LINES = [
    [:a1, :a2, :a3], [:b1, :b2, :b3], [:c1, :c2, :c3],
    [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3],
    [:a1, :b2, :c3], [:a3, :b2, :c1]
  ]

def prompt(message)
  puts "==> #{message}"
end

def display_board(brd)
  system "clear"
  puts ""
  puts "a1     |a2     |a3     "
  puts "   #{brd[:a1]}   |   #{brd[:a2]}   |   #{brd[:a3]}   "
  puts "       |       |"
  puts "-------+-------+-------"
  puts "b1     |b2     |b3     "
  puts "   #{brd[:b1]}   |   #{brd[:b2]}   |   #{brd[:b3]}   "
  puts "       |       |"
  puts "-------+-------+-------"
  puts "c1     |c2     |c3"
  puts "   #{brd[:c1]}   |   #{brd[:c2]}   |   #{brd[:c3]}   "
  puts "       |       |"
end

def initialize_board
  coordinates = %i(a1 a2 a3 b1 b2 b3 c1 c2 c3)
  new_board = {}
  coordinates.each { |coordinate| new_board[coordinate] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |coordinate| brd[coordinate] == INITIAL_MARKER }
end

def joinor(array, punctuation="", ending_word="")
  new_arr = array.map { |number| number.to_s }
  new_arr[-1] = "#{ending_word} #{new_arr[-1]}"
  new_arr.join("#{punctuation} ")
end

def player_move!(brd)
  coordinate = nil
  loop do
    prompt "Please choose a square by entering the corresponding coordinate:
    Available choices include #{joinor(empty_squares(brd), ',', "or")}"
    coordinate = gets.chomp.downcase.to_sym
    break if empty_squares(brd).include?(coordinate)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[coordinate] = PLAYER_MARKER
end


def computer_move!(brd)
  if !opportunity?(brd).empty?
    opportunity = opportunity?(brd)
    brd[offense_play(opportunity, brd)] = COMPUTER_MARKER
  elsif !threat?(brd).empty? && opportunity?(brd).empty?
    threat = threat?(brd)
    brd[threat_response(threat, brd)] = COMPUTER_MARKER
  elsif brd[:b2] == INITIAL_MARKER
    brd[:b2] = COMPUTER_MARKER
  else
    coordinate = empty_squares(brd).sample.to_sym
    brd[coordinate] = COMPUTER_MARKER
  end
end


def place_piece!(brd, current_player)
  if current_player == "computer"
    computer_move!(brd)
  elsif current_player == "player"
    player_move!(brd)
  end
  display_board(brd)
end

def alternate_player(current_player) ###
  if current_player == "computer"
    return "player"
  elsif current_player == "player"
    return "computer"
  end
end

def opportunity?(brd)
  opportunity = WINNING_LINES.select do |line|
    computer_mark = 0
    player_mark = 0
    line.each do |coord|
      computer_mark += 1 if brd[coord] == COMPUTER_MARKER
      player_mark += 1 if brd[coord] == PLAYER_MARKER
    end
    computer_mark == 2 && player_mark == 0
  end
  opportunity.flatten
end

def offense_play(opportunity, brd)
  if opportunity.empty?
    nil
  else 
    offense = opportunity.select {|coord| brd[coord] == INITIAL_MARKER}
    offense[0]
  end
end

def threat?(brd)
  threat = WINNING_LINES.select do |line|
    player_mark = 0
    computer_mark = 0
    line.each do |coord|
      player_mark += 1 if brd[coord] == PLAYER_MARKER
      computer_mark += 1 if brd[coord] == COMPUTER_MARKER
    end
    player_mark == 2 && computer_mark == 0
  end
  threat.flatten
end

def threat_response(threat, brd) #####
  if threat.empty?
    nil
  else
    response = threat.select {|coord| brd[coord] == INITIAL_MARKER}
    response[0]
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return "You"
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return "Computer"
    end
  end
  nil
end

def whos_winning?(computer_score, player_score)
  if computer_score == player_score
    return "Computer: #{computer_score}. You: #{player_score}. You and Computer are currently tied."
  elsif computer_score > player_score
    return "Computer: #{computer_score}. You: #{player_score}. Computer is currently winning."
  elsif computer_score < player_score
    return "You: #{player_score}. Computer: #{computer_score}. You are currently winning."
  end
end

computer_score = 0
player_score = 0

loop do
  
  board = initialize_board
  display_board(board)
  prompt("Welcome to Tic-Tac-Toe!")
  sleep(0.8)
  prompt("First to 5 wins!")
  sleep(0.8)
  prompt("#{whos_winning?(computer_score, player_score)}")
  sleep(0.8)
  prompt("You are '#{PLAYER_MARKER}', Computer is '#{COMPUTER_MARKER}'")
  sleep(0.8)

  current_player = nil

  loop do
    prompt("Who should go first? Enter 'me' or 'computer'")
    player = gets.chomp.downcase
    if player == "me"
      current_player = "player"
    elsif player == "computer"
      current_player = "computer"
    end
    break if current_player == "player"
    break if current_player == "computer"
    prompt("Hmmm...can you repeat that?")
  end

  loop do
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break display_board(board) if board_full?(board) || winner?(board)
  end
  
  if winner?(board)
    prompt("#{detect_winner(board)} won!")
    computer_score += 1 if detect_winner(board) == "Computer"
    player_score += 1 if detect_winner(board) == "You"
  else
    prompt("It's a tie!")
  end

  break prompt("Computer has 5 points, Computer wins!") if computer_score == 5
  break prompt("You have 5 points, you win!") if player_score == 5

  prompt("Do you want to play again? Enter Yes or No (or Y / N)")
  answer = gets.chomp
  break unless answer[0].downcase == "y"
end

prompt("Thanks for playing Tic-Tac-Toe, Ho!")
prompt("The final scores were: Computer: #{computer_score}. You: #{player_score}")
