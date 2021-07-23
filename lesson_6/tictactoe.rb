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
  coordinate = empty_squares(brd).sample.to_sym
  brd[coordinate] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [
    [:a1, :a2, :a3], [:b1, :b2, :b3], [:c1, :c2, :c3],
    [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3],
    [:a1, :b2, :c3], [:a3, :b2, :c1]
  ]

  winning_lines.each do |line|
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

loop do
  board = initialize_board
  display_board(board)
  prompt("Welcome to Tic-Tac-Toe!")
  sleep(0.8)
  prompt("You are '#{PLAYER_MARKER}', Computer is '#{COMPUTER_MARKER}'")
  sleep(0.8)

  loop do
    player_move!(board)
    break display_board(board) if winner?(board) || board_full?(board)
    computer_move!(board)
    break display_board(board) if winner?(board) || board_full?(board)
    display_board(board)
  end

  if winner?(board)
    prompt("#{detect_winner(board)} won!")
  else
    prompt("It's a tie!")
  end

  prompt("Do you want to play again? Enter Yes or No (or Y / N)")
  answer = gets.chomp
  break unless answer[0].downcase == "y"
end

prompt("Thanks for playing Tic-Tac-Toe, Ho!")
