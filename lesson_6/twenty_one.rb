GAME_VALUE = 21
DEALER_HITS_BELOW = 17
CARD_VALUES = %w[2 3 4 5 6 7 8 9 J Q K A]
CARD_SUITS = %w[D C H S]

def joinor(arr, delim = ',', word = 'or')
  arr.map.with_index do |element, idx|
    case idx
    when 0 then element.to_s
    when arr.size - 1 then " #{word} #{element}"
    else "#{delim} #{element}"
    end
  end.join
end

def initialize_deck
  cards = []
  CARD_SUITS.each do |suit|
    CARD_VALUES.each do |value|
      card = []
      card[0] = value
      card[1] = suit
      cards << card
    end
  end
  cards
end

def value_of_hand(hand)
  values = hand.map { |card| card[0] }
  total = 0
  values.each do |value|
    total += if value == 'A'
               11
             elsif value.to_i.zero?
               10
             else
               value.to_i
             end
  end

  values.select { |value| value == 'A' }.count.times do
    total -= 10 if total > GAME_VALUE
  end

  total
end

def retrieve_player_move
  loop do
    puts 'Hit or Stay? (press H to Hit, S to Stay):'
    move = gets.chomp.downcase
    return move if move =~ /^[hs]{1}$/

    puts 'Invalid Input. Please select from the options provided.'
  end
end

def deal_card!(deck)
  deck.delete(deck.sample)
end

def busted?(value)
  value > GAME_VALUE
end

def display_move_selected(move, cur_player)
  if move == 'h'
    puts "#{cur_player.upcase} H I T S"
    puts '-' * 20
  else
    puts "#{cur_player.upcase} S T A Y S"
  end
  sleep(2)
end

def display_current_score_and_turn(player, score)
  system 'clear' || 'cls'
  puts "|Game: #{GAME_VALUE}|".center(20)
  puts "|Dealer: #{score[:dealer]}|Player: #{score[:player]}|".center(20)
  puts '-' * 20
  puts "#{player.upcase}'S TURN"
  puts '-' * 20
end

def display_hands(playerhand, dealerhand, cur_player, scr)
  list_player_cards = playerhand.map { |e| e[0] }
  list_dealer_cards = dealerhand.map { |e| e[0] }
  display_current_score_and_turn(cur_player, scr)
  if cur_player == 'player'
    puts "Dealer has #{list_player_cards[0]} and ?"
  else
    puts "Dealer has #{joinor(list_dealer_cards, ',', 'and')}"
  end
  puts "Player has #{joinor(list_player_cards, ',', 'and')}"
  puts '-' * 20
end

def retrieve_dealers_move(hand)
  value_of_hand(hand) < DEALER_HITS_BELOW ? 'h' : 's'
end

def play_again?
  puts '-' * 20
  puts 'Do you want to play again? (y or n)'
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def deal_starting_hands!(playerhand, dealerhand, card_deck)
  2.times do
    playerhand << deal_card!(card_deck)
    dealerhand << deal_card!(card_deck)
  end
end

def display_round_results(busted_flags, dealervalue, playervalue, scr)
  if busted_flags[:player]
    puts 'You Busted! Dealer Wins the Round!'
    scr[:dealer] += 1
  elsif busted_flags[:dealer]
    puts 'Dealer Busted! You Win the Round!'
    scr[:player] += 1
  elsif dealervalue == playervalue
    puts 'Round Tied!!!'
  elsif dealervalue > playervalue
    puts "Dealer has #{dealervalue} vs Player's #{playervalue} | Dealer Wins the Round!"
    scr[:dealer] += 1
  else
    puts "Player has #{playervalue} vs Dealer's #{dealervalue} | Player Wins the Round!"
    scr[:player] += 1
  end
  sleep(4)
end

score = { player: 0, dealer: 0 }
loop do
  # NEW ROUND ------------------------------------------
  card_deck = initialize_deck
  players_hand = []
  dealers_hand = []
  players_hand_value = 0
  dealers_hand_value = 0
  current_player = 'player'
  busted_flags = { player: false, dealer: false }

  # DEAL STARTING HANDS AND SHOW CARDS ------------------

  deal_starting_hands!(players_hand, dealers_hand, card_deck)
  display_hands(players_hand, dealers_hand, current_player, score)

  # PLAYERS TURN ----------------------------------------
  loop do
    players_move = retrieve_player_move
    display_hands(players_hand, dealers_hand, current_player, score)
    players_hand << deal_card!(card_deck) if players_move == 'h'
    display_move_selected(players_move, current_player)
    display_hands(players_hand, dealers_hand, current_player, score)
    players_hand_value = value_of_hand(players_hand)
    break if players_move == 's' || busted?(players_hand_value)
  end

  if busted?(players_hand_value)
    busted_flags[:player] = true 
    display_round_results(busted_flags, dealers_hand_value, players_hand_value, score)
    next
  end

  # DEALERS TURN -----------------------------------------
  current_player = 'dealer'
  display_hands(players_hand, dealers_hand, current_player, score)

  loop do
    dealers_move = retrieve_dealers_move(dealers_hand)
    display_hands(players_hand, dealers_hand, current_player, score)
    dealers_hand << deal_card!(card_deck) if dealers_move == 'h'
    display_move_selected(dealers_move, current_player)
    display_hands(players_hand, dealers_hand, current_player, score)
    dealers_hand_value = value_of_hand(dealers_hand)
    break if dealers_move == 's' || busted?(dealers_hand_value)
  end

  busted_flags[:dealer] = true if busted?(dealers_hand_value)
  display_round_results(busted_flags, dealers_hand_value, players_hand_value, score)
end
