=begin
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end
CARD_VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K', 'A']
CARD_SUITS = ['D', 'C', 'H', 'S']

def initialize_deck
  cards = []
  CARD_SUITS.each do |suit|
    CARD_VALUES.each do |value|
      card = []
      card[0], card[1] = value, suit
      cards << card
    end
  end
  cards
end

def deal_starting_hand!(deck)
  hand = []

  2.times do
  hand << deck.delete(deck.sample)
  end

  hand
end

def value_of_hand(hand)
  values = hand.map { |card| card[0] }
  total = 0
  values.each do |value|
    if value == 'A'
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  values.select { |value| value == "A" }.count.times do
    total -= 10 if total > 21
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

def busted?(hand)
  value_of_hand(hand) > 21
end



# SETUP GAME
card_deck = initialize_deck
2.times do
players_hand << deal_card!(card_deck)
dealers_hand << deal_card!(card_deck)
end


loop do
  move = retrieve_player_move
  players_hand << deal_card!(card_deck) if move == 'h'
  break if move == 's' || busted?(players_hand)
end



