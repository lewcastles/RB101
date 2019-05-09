GAME_VALUE = 21
DEALER_HITS_BELOW = 17
SCORE_TO_WIN_GAME = 3
MOVE_DELAY = 1.2
ROUND_DELAY = 3
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
      cards << [value, suit]
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
    puts "#{cur_player.upcase} HITS!"
  else
    puts "#{cur_player.upcase} STAYS!"
  end
  sleep(MOVE_DELAY)
end

def display_current_score_and_turn(score)
  system 'clear' || 'cls'
  puts "Playing #{GAME_VALUE} - First player to #{SCORE_TO_WIN_GAME} Wins!"
  puts "Dealer Score: #{score[:dealer]}"
  puts "Player Score: #{score[:player]}"
  puts '-' * 20
end

def display_hands(playerhand, dealerhand, cur_player, scr)
  list_player_cards = playerhand.map { |e| e[0] }
  list_dealer_cards = dealerhand.map { |e| e[0] }
  display_current_score_and_turn(scr)
  if cur_player == 'player'
    puts "Dealer has #{list_dealer_cards[0]} and ?"
  else
    puts "Dealer has #{joinor(list_dealer_cards, ',', 'and')}"
  end
  puts "Player has #{joinor(list_player_cards, ',', 'and')}"
  puts '-' * 20
end

def retrieve_dealers_move(hand)
  value_of_hand(hand) < DEALER_HITS_BELOW ? 'h' : 's'
end

def prompt_user_play_again
  puts 'Would you like to play another game? '
  puts "Enter the 'Y' key to restart the game, "\
  "'N' key to close the program."
  loop do
    answer = gets.chomp
    return answer if valid_y_n_key(answer)

    puts 'Invalid Entry. Please try again.'
  end
end

def valid_y_n_key(str)
  str.match(/^[yn]?$/i) && !str.empty?
end

def play_again?(str)
  str.match(/^[y]?$/i)
end

def deal_starting_hands!(playerhand, dealerhand, card_deck)
  2.times do
    playerhand << deal_card!(card_deck)
    dealerhand << deal_card!(card_deck)
  end
end

def increment_score_counters!(busted_flags, dealerval, playerval, scr)
  if      busted_flags[:player] then  scr[:dealer] += 1
  elsif   busted_flags[:dealer] then  scr[:player] += 1
  elsif   dealerval > playerval then  scr[:dealer] += 1
  elsif   playerval > dealerval then  scr[:player] += 1
  end
end

def display_round_result(busted_flags, dealerval, playerval)
  if busted_flags[:player]
    puts 'You Busted! Dealer Wins the Round!'
  elsif busted_flags[:dealer]
    puts 'Dealer Busted! You Win the Round!'
  elsif dealerval == playerval
    puts 'Round Tied!!!'
  elsif dealerval > playerval
    puts "Dealer's #{dealerval} vs Player's #{playerval} | Dealer Wins Round!"
  else
    puts "Player's' #{playerval} vs Dealer's #{dealerval} | Player Wins Round!"
  end
  sleep(ROUND_DELAY)
end

def display_game_results(score)
  system 'clear' || 'cls'
  puts '-' * 40
  if score[:dealer] > score[:player]
    puts "Dealer wins the game: #{score[:dealer]} to #{score[:player]}"
  else
    puts "Player wins the game: #{score[:player]} to #{score[:dealer]}"
  end
  puts '-' * 40
end

def match_ended?(scr)
  scr.values.any? { |e| e >= SCORE_TO_WIN_GAME }
end

def display_hands_with_move(player_hand, dealer_hand, cur_player, move, score)
  display_hands(player_hand, dealer_hand, cur_player, score)
  display_move_selected(move, cur_player)
  display_hands(player_hand, dealer_hand, cur_player, score)
end

def hit?(move)
  move == 'h'
end

def stayed?(move)
  move == 's'
end

def game_target_value?(value)
  value == GAME_VALUE
end

def blackjack?(hand)
  hand.size == 2 && value_of_hand(hand) == GAME_VALUE
end

loop do
  score = { player: 0, dealer: 0 }
  loop do
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

    if blackjack?(players_hand) || blackjack?(dealers_hand)
      current_player = 'dealer'
      display_hands(players_hand, dealers_hand, current_player, score)
      puts 'BLACKJACK!!'

      display_round_result(busted_flags, value_of_hand(dealers_hand), value_of_hand(players_hand))
      increment_score_counters!(busted_flags, value_of_hand(dealers_hand), \
                                value_of_hand(players_hand), score)
      match_ended?(score) ? break : next
    end

    # PLAYERS TURN ----------------------------------------
    loop do
      players_move = retrieve_player_move
      players_hand << deal_card!(card_deck) if hit?(players_move)
      display_hands_with_move(players_hand, dealers_hand, current_player, \
                              players_move, score)
      players_hand_value = value_of_hand(players_hand)
      break if stayed?(players_move) || busted?(players_hand_value) || \
               game_target_value?(players_hand_value)
    end

    if busted?(players_hand_value)
      busted_flags[:player] = true
      display_round_result(busted_flags, dealers_hand_value, players_hand_value)
      increment_score_counters!(busted_flags, dealers_hand_value, \
                                players_hand_value, score)
      match_ended?(score) ? break : next
    end

    # DEALERS TURN -----------------------------------------
    current_player = 'dealer'
    display_hands(players_hand, dealers_hand, current_player, score)
    dealers_hand_value = value_of_hand(dealers_hand)

    loop do
      dealers_move = retrieve_dealers_move(dealers_hand)
      dealers_hand << deal_card!(card_deck) if hit?(dealers_move)
      display_hands_with_move(players_hand, dealers_hand, current_player, \
                              dealers_move, score)
      dealers_hand_value = value_of_hand(dealers_hand)
      break if stayed?(dealers_move) || busted?(dealers_hand_value)
    end

    # ROUND END UPDATE SCORE --------------------------------
    busted_flags[:dealer] = true if busted?(dealers_hand_value)
    display_round_result(busted_flags, dealers_hand_value, players_hand_value)
    increment_score_counters!(busted_flags, dealers_hand_value, \
                              players_hand_value, score)

    break if match_ended?(score)
  end

  # MATCH END ------------------------------------------------

  display_game_results(score)

  response = prompt_user_play_again
  break unless play_again?(response)
end
