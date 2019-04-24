require 'pry'

hand = [['Q'], [7]]

def value_of_hand(hand)
  values = hand.map { |card| card[0] }
  total = 0
  values.each do |value|
    binding.pry
    total += if value == 'A'
    
               11
             elsif value.to_i.zero?
               total += 10
             else
               total += value.to_i
             end
  end

  values.select { |value| value == 'A' }.count.times do
    total -= 10 if total > 21
  end

  total
end

p value_of_hand(hand)