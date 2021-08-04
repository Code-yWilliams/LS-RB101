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
    hand_values -= 10 if hand_values > 21
  end
  hand_values
end

def display_hand_values(player_hand, dealer_hand)
  puts "Your hand has a value of #{calc_value(player_hand)}"
  sleep(2)
  puts "Dealer's hand has a value of #{calc_value(dealer_hand)}"
  sleep(2)
end

def bust?(hand)
  calc_value(hand) > 21
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

def display_winner(player_hand, dealer_hand)
  win_message = if calc_value(player_hand) > calc_value(dealer_hand)
                  "You win!"
                elsif calc_value(player_hand) < calc_value(dealer_hand)
                  "Dealer wins!"
                else
                  "It's a tie!"
                end
  puts win_message
end

def play_again?
  puts "Would you like to play again? Enter 'yes' or 'no'"
  play_again = gets.chomp.downcase[0]
  play_again == "y"
end

system "clear"
puts "Welcome to 21!"
sleep(2.5)

loop do
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
    break if bust?(player_hand)
  end

  if bust?(player_hand)
    puts "You busted with #{joinand(player_hand)}"
    sleep(3)
    puts "Your hand's value of #{calc_value(player_hand)} is greater than 21."
    sleep(2)
    puts "Dealer wins!"
    sleep(3)
    play_again? ? next : break
  end

  loop do
    system "clear"
    if calc_value(dealer_hand) < 17
      puts "Dealer chose to hit!"
      hit!(deck, dealer_hand)
      countdown
    else
      puts "Dealer chose to stay!"
      countdown
      system "clear"
      break
    end
    break if bust?(dealer_hand)
  end

  if bust?(dealer_hand)
    puts "Dealer busted with #{joinand(dealer_hand)}"
    sleep(3)
    puts "Dealer's hand's value of #{calc_value(dealer_hand)} is greater than 21."
    sleep(2)
    puts "You win!"
    play_again? ? next : break
  end

  puts "And now, the results..."
  sleep(2.5)
  display_hands(player_hand, dealer_hand, hide_dealer_hand: false)
  display_hand_values(player_hand, dealer_hand)
  system "clear"
  display_winner(player_hand, dealer_hand)
  play_again? ? next : break
end
