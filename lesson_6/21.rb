SUITS = ["Hearts", "Diamonds", "Spades", "Clubs"]
CARDS = [
  "Two", "Three", "Four", "Five", "Six", "Seven",
  "Eight", "Nine", "Ten", "Jack", "Queen", "King", "Ace"
]
ALL_CARDS = []
SUITS.each do |suit|
  CARDS.each do |card|
    ALL_CARDS << [card, suit]
  end
end

WINNING_NUMBER = 21
DEALER_HIT_STAY_THRESHOLD = 17

def initialize_deck(deck)
  available_cards = ALL_CARDS.dup
  until deck.size == 52
    current_card = available_cards.sample
    available_cards.delete(current_card)
    deck << current_card
  end
end

def deal!(deck, player_hand, dealer_hand)
  player_hand << deck[0] << deck[1]
  dealer_hand << deck[2] << deck[3]
  4.times { deck.shift }
end

def joinand(hand, punctuation=",", ending_word="and")
  new_hand = hand.map { |card| "#{card[0]} of #{card[1]}" }
  new_hand[-1] = "#{ending_word} #{new_hand[-1]}"
  new_hand.join("#{punctuation} ")
end

def display_hands(player_hand, dealer_hand, hide_dealer_hand: true)
  puts "You have: #{joinand(player_hand)}"
  sleep(2)
  if hide_dealer_hand
    puts "Dealer has: #{dealer_hand[0][0]} of #{dealer_hand[0][1]}, and ???"
  else
    puts "Dealer has: #{joinand(dealer_hand)}"
  end
  sleep(2)
end

def calc_value(hand)
  values = {
    "Two" => 2, "Three" => 3, "Four" => 4, "Five" => 5, "Six" => 6,
    "Seven" => 7, "Eight" => 8, "Nine" => 9, "Ten" => 10, "Jack" => 10,
    "Queen" => 10, "King" => 10, "Ace" => 11
  }
  hand_values = 0
  hand.each { |card| hand_values += values[card[0]] }
  hand.select { |card| card[0] == "Ace" }.size.times do
    hand_values -= 10 if hand_values > WINNING_NUMBER
  end
  hand_values
end

def display_hand_values(player_total, dealer_total)
  puts "Your hand has a value of #{player_total}"
  sleep(3)
  puts "Dealer's hand has a value of #{dealer_total}"
  sleep(3)
end

def bust?(hand_total)
  hand_total > WINNING_NUMBER
end

def hit!(deck, hand)
  hand << deck[0]
  deck.shift
end

def countdown
  sleep(0.66)
  print(".")
  sleep(0.66)
  print(".")
  sleep(0.66)
  print(".")
  sleep(0.5)
  system "clear"
end

def display_winner(player_total, dealer_total)
  win_message = if player_total > WINNING_NUMBER
                  "You busted! Dealer wins!"
                elsif dealer_total > WINNING_NUMBER
                  "Dealer busted! You win!"
                elsif player_total > dealer_total
                  "You win!"
                elsif player_total < dealer_total
                  "Dealer wins!"
                else
                  "It's a tie!"
                end
  puts win_message
  sleep(3)
end

def play_again?
  play_again = nil
  loop do
    puts "Would you like to play again? Enter 'yes' or 'no'"
    play_again = gets.chomp.downcase[0]
    break if play_again == "y" || play_again == "n"
    puts "Sorry, that's not a valid answer."
  end
  play_again == "y"
end

def grand_output(player_hand, dealer_hand, player_total, dealer_total)
  display_hands(player_hand, dealer_hand, hide_dealer_hand: false)
  display_hand_values(player_total, dealer_total)
  display_winner(player_total, dealer_total)
end

def five_wins?(player_score, dealer_score)
  player_score == 5 || dealer_score == 5
end

def five_game_winner(player_score, dealer_score)
  if player_score == 5
    "You"
  elsif dealer_score == 5
    "Dealer"
  end
end

player_score = 0
dealer_score = 0

system "clear"
puts "Welcome to #{WINNING_NUMBER}!"
countdown
puts "First to 5 wins!"
countdown

loop do
  system "clear"
  puts "Current score:"
  puts "Dealer: #{dealer_score}"
  puts "You: #{player_score}"
  countdown
  system "clear"
  puts "Shuffling!"
  deck = []
  initialize_deck(deck)
  sleep(2)
  system "clear"
  puts "Dealing!"
  sleep(2)

  player_hand = []
  dealer_hand = []

  deal!(deck, player_hand, dealer_hand)
  player_total = calc_value(player_hand)
  dealer_total = calc_value(player_hand)

  answer = nil
  loop do
    system "clear"
    display_hands(player_hand, dealer_hand)
    puts "Would you like to hit or stay?"
    answer = gets.chomp.downcase
    system "clear"
    case answer
    when "hit"
      puts "You chose to hit!"
      hit!(deck, player_hand)
      countdown
    when "stay"
      puts "You chose to stay!"
      countdown
      system "clear"
      break
    else
      puts "Hmm...I don't recognize that input."
      sleep(2)
    end
    player_total = calc_value(player_hand)
    break if bust?(player_total)
  end

  if bust?(player_total)
    grand_output(player_hand, dealer_hand, player_total, dealer_total)
    dealer_score += 1
    if five_wins?(player_score, dealer_score)
      puts "#{five_game_winner(player_score, dealer_score)} won 5 times! Game over!"
      sleep(3)
      break
    end
    play_again? ? next : break
  end

  system "clear"
  puts "Dealer's turn!"
  sleep(2)

  loop do
    system "clear"
    if dealer_total < DEALER_HIT_STAY_THRESHOLD
      puts "Dealer chose to hit!"
      hit!(deck, dealer_hand)
      countdown
    else
      puts "Dealer chose to stay!"
      countdown
      system "clear"
      break
    end
    dealer_total = calc_value(dealer_hand)
    break if bust?(dealer_total)
  end

  if bust?(dealer_total)
    grand_output(player_hand, dealer_hand, player_total, dealer_total)
    player_score += 1
    if five_wins?(player_score, dealer_score)
      puts "#{five_game_winner(player_score, dealer_score)} won 5 times! Game over!"
      sleep(3)
      break
    end
    play_again? ? next : break
  end

  if player_total > dealer_total
    player_score += 1
  elsif player_total < dealer_total
    dealer_total += 1
  end

  puts "And now, the results..."
  sleep(2.5)
  grand_output(player_hand, dealer_hand, player_total, dealer_total)
  countdown
  if five_wins?(player_score, dealer_score)
    puts "#{five_game_winner(player_score, dealer_score)} won 5 times! Game over!"
    sleep(3)
    break
  end
  break unless play_again?
end

system "clear"
countdown
puts "Final score was:"
puts "Dealer: #{dealer_score}"
puts "You: #{player_score}"
countdown
puts "Thanks for playing #{WINNING_NUMBER}! Bye!"
