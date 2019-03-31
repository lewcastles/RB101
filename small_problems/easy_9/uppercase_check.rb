def uppercase?(str)
  str.chars.all? { |e| e =~ /[^a-z]/ }
end





p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true